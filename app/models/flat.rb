class Flat < ApplicationRecord
  belongs_to :user
    TYPES = %w(flat maisonette detached)
end
