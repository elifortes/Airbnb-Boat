class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :boat, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  # validates :status, presence: true


end
