class Booking < ApplicationRecord
  attr_accessor :check_in, :total

  belongs_to :flat
  belongs_to :user
end
