class Chatroom < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :tenant, class_name: "User"

  validates :owner, uniqueness: { scope: :tenant,
    message: "you already have a chat with this user" }
end
