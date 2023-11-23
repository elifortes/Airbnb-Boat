class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  #  searchkick
  # validates :price_per_unit, :reviews, :year_made, numericality: { greater_than: 0 }
  validates :title, :description, :price_per_unit, presence: true

  # validates :availability_from, :availability_to, presence: true, if: :date_range
  # def date_range
  #   availability_from.present? && availability_to.present? && availability_from < availability_to
  # end
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many_attached :photos, dependent: :destroy

  # include PgSearch::Model
  # pg_search_scope :search_by_title, against: :title,
  # using: {
  #   :tsearch => { :prefix => true }
  # }

  include PgSearch::Model
  pg_search_scope :search_boats,
                  against: %i[title price_per_unit captain_name guest_capacity],
                  using: {
                    tsearch: { prefix: true }
                  }
end

# validates :title, :description, :price_per_unit, :captain_name, :guest_capacity, :availability_from, :availability_to, :boat_maker_name, :boat_model, :boat_size, :year_made, presence: true
