class MessagesController < ApplicationController

  # GET /messages
  def index
    @user_received_messages = current_user.received_messages
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  def create
    @message = current_user.messages.create message_params 
    user = User.where(email: message_params[:receiver]).first 
    respond_to do |format|	
      if !user.nil? && message_params[:body].present?
        @message.receiver = user.id
        @message.save 
        format.html { redirect_to messages_path(@user), notice: t(:message_send) }
      else
        format.html { redirect_to new_message_path, notice: t(:message_error) }
      end
    end 
  end

  private
  def message_params
      params.require(:message).permit(:body, :receiver)
  end

end
