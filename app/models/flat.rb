class Flat < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos

  TYPES = %w(flat maisonette detached)
end
