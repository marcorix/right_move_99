class Chatroom < ApplicationRecord
  belongs_to :booking
  belongs_to :tenant, class_name: "User"
  has_many :messages
  
  validates :booking, uniqueness: { scope: :tenant,
    message: "you already have a chat with this booking" }
end
