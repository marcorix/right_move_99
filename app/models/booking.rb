class Booking < ApplicationRecord
  attr_accessor :check_in
  
  belongs_to :flat
  belongs_to :user
end
