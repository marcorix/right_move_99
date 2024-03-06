class User < ApplicationRecord
  has_many :flats
  has_many :bookings

  has_many :chatrooms_as_user1, class_name: "Chatroom", foreign_key: :user_1
  has_many :chatrooms_as_user2, class_name: "Chatroom", foreign_key: :user_2

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.nickname
    self.email.match(/^([^@]+)/)
  end
end
