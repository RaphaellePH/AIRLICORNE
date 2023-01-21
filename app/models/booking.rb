class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :licorne

  scope :pending, -> { where(status: "pending") }
  scope :confirmed, -> { where(status: "confirmed") }
end
