class Delivery < ApplicationRecord
  belongs_to :path
  enum Status: {
    pending: 1,
    in_progress: 2,
    completed: 3,
    canceled: 4
  }
end
