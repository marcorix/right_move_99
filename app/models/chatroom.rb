class Chatroom < ApplicationRecord
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  validates :user_1, uniqueness: { scope: :user_2,
    message: "you already have a chat with this user" }
end
