class MessagesController < ApplicationController
	def index

		@user = User.find(current_user)
		@messages = Message.all
		
	end
	def show

		@message = Message.find(current_user)
	end

 	def new
    @message = Message.new
  end
	
	def send_message(sender_message, receiver_message)
  	sender_message.user_id = current_user.id

    sender_message.to_from = @message.to_from
    sender_message.body = @message.body
    sender_message.sent = true
    sender_message.save

		receiver_message.user_id = @message.to_from
    receiver_message.body = @message.body
    receiver_message.to_from = current_user.id
    receiver_message.sent = false
    receiver_message.save
	end   

  def create
   	@sender_message = current_user.messages.create(message_params)
    user = User.find_by(email: message_params[:to_from])	
    @sender_message.to_from = user.id
		@sender_message.sent = true


    @receiver_message = user.messages.create(message_params)
    @receiver_message.to_from = current_user.id
    @receiver_message.sent = false

    @sender_message.save
    @receiver_message.save 
    redirect_to messages_path(@user), notice: 'message sent successfully...' 
  end
	
  def message_params
      params.require(:message).permit(:body, :to_from)
  end

end
