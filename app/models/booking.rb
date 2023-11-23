class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :boat, dependent: :destroy


  # validates :user_id, presence: true
  # validates :boat_id, presence: true
  # validates :start_date, presence: true
  # validates :end_date, comparison: { greater_than: :start_date }
  # validates :status, presence: true
  # validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }


end
