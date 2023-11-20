class Boat < ApplicationRecord
  belongs_to :user

  validates :availability_from, :availability_to, future_date: true
  validates :price_per_unit, :reviews, :guest_capacity, :year_made, numericality: { greater_than: 0 }
  validates :title, :description, :price_per_unit, presence: true
  
  has_many_attached :photos
end

# validates :title, :description, :price_per_unit, :captain_name, :guest_capacity, :availability_from, :availability_to, :boat_maker_name, :boat_model, :boat_size, :year_made, presence: true
