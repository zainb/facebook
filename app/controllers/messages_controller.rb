class MessagesController < ApplicationController
	def index
		@user = User.find(current_user)
		Message.find_each do |message|
      @messages = message
    end
	end
	
	def show
		@message = Message.find(current_user)
	end

 	def new
    @message = Message.new
  end
	
	def create
   	@message = current_user.messages.create(message_params)
    user = User.find_by(email: message_params[:to_from])	
    if !user.nil? && message_params[:body] != ''
    	@message.to_from = user.id
    	@message.save 
    	redirect_to messages_path(@user), notice: 'message sent successfully...'
    else
    	redirect_to new_message_path, notice: 'id or message body was invalid, message is not sent...'
    end 
  end
	
	private
  def message_params
      params.require(:message).permit(:body, :to_from)
  end

end
