class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  # def create
  #   user1 = current_user
  #   user2 = User.find(params[:user_id])
  #   name = "#{user1.email.match(/^([^@]+)/)} / #{user2.email.match(/^([^@]+)/)}"
  #   chatroom = Chatroom.new(user_1: user1, user_2: user2, name: name)
  #   if chatroom.save!
  #     redirect_to chatroom_path(chatroom)
  #   else
  #     render 'pages/dashboard', stauts: :unprocessable_entity
  #   end
  # end
end
