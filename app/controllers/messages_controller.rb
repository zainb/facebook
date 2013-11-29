class MessagesController < ApplicationController
	def index

		@messages = Message.all
		
	end
	def show

		@message = Message.find(params[:id])
	end

	def send_message
		
	end
	
  def post_params
      params.require(:message).permit(:body, :user_id, :send_to)
    end

end
