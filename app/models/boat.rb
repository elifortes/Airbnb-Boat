class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # validates :price_per_unit, :reviews, :year_made, numericality: { greater_than: 0 }
  # validates :title, :description, :price_per_unit, presence: true

  has_many_attached :photos
end

# validates :title, :description, :price_per_unit, :captain_name, :guest_capacity, :availability_from, :availability_to, :boat_maker_name, :boat_model, :boat_size, :year_made, presence: true
