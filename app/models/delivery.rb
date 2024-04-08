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

  before_save :build_sender_name
  after_update :update_status_and_details, :build_receiver_name

  private

  def build_sender_name
    if sender_first_name_changed? || sender_last_name_changed?
      self.sender_full_name = [sender_first_name, sender_last_name].join(' ').strip
    end
  end

  def build_receiver_name
    if receiver_first_name_changed? || receiver_last_name_changed?
      self.receiver_full_name = [receiver_first_name, receiver_last_name].join(' ').strip
    end
  end

  def update_status_and_details
    if receiver_signature_changed?
      update_attributes(
        status: :completed,
        delivery_date: Time.zone.today,
        delivery_time: Time.zone.now,
      )
    end
  end

end
