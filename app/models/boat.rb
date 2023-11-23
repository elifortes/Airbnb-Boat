class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :price_per_unit, :guest_capacity, :availability_from, :availability_to, presence: true

  def date_range
    if availability_from.present? && availability_to.present?
      if availability_from >= availability_to
        errors.add(:availability_to, "should be a date after the start date (availability from)")
      end
    else
      errors.add(:availability_from, "can't be blank") unless availability_from.present?
      errors.add(:availability_to, "can't be blank") unless availability_to.present?
    end
  end

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many_attached :photos, dependent: :destroy


  include PgSearch::Model
  pg_search_scope :search_boats,
                  against: %i[title price_per_unit captain_name guest_capacity location],
                  using: {
                    tsearch: { prefix: true }
                  }
end
