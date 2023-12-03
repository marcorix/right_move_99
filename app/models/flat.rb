class Flat < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos

  acts_as_votable

  TYPES = %w(flat maisonette detached)

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_property_type,
    against: [ :name, :address, :property_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
