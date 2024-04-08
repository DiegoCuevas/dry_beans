class Delivery < ApplicationRecord
  belongs_to :path

  enum status: {
    pending: 1,
    in_progress: 2,
    completed: 3,
    canceled: 4
  }

  validates :path_id, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :signature, length: { maximum: 255 }, presence: true
  validates :observations, length: { maximum: 255 }

  validates :receiver_first_name, presence: true, if: :update_receiver_info?
  validates :receiver_last_name, presence: true, if: :update_receiver_info?
  validates :receiver_signature, presence: true, if: :update_receiver_info?
  validates :delivery_photo, format: { with: /\Ahttps?:\/\/.*\z/, message: "must be a valid URL" }, allow_blank: true, on: :update_receiver_info

  before_save :build_sender_name
  after_update :update_status_and_details, :build_receiver_name

  def update_receiver_info receiver_params
    update(receiver_params)
  end

  private

  def build_sender_name
    if sender_first_name? || sender_last_name?
      self.sender_full_name = [sender_first_name, sender_last_name].join(' ').strip
    end
  end

  def build_receiver_name
    if receiver_first_name? || receiver_last_name?
      self.receiver_full_name = [receiver_first_name, receiver_last_name].join(' ').strip
    end
  end

  def update_status_and_details
    if receiver_signature?
      update_columns(
        status: :completed,
        delivery_date: Time.zone.today,
        delivery_time: Time.zone.now
      )
    end
  end

  def update_receiver_info?
    receiver_first_name_changed? || receiver_last_name_changed? || receiver_signature_changed? || delivery_photo_changed?
  end
end
