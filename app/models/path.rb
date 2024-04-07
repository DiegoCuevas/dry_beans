class Path < ApplicationRecord
  belongs_to :journey
  has_many :deliveries
end
