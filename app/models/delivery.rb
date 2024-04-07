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
  validates :status, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true
  validates :signature, length: { maximum: 255 }
  validates :observations, length: { maximum: 255 }
  validates :delivery_photo, format: { with: /\Ahttps?:\/\/.*\z/, message: "must be a valid URL" }, allow_blank: true
end
