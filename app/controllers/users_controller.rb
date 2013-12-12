class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	
	def index
		@users = User.all
	end

	def add_friend
		@user = User.find(params[:id])
		current_user.friends_lists.where(:friend_id => @user.id).first_or_create
		respond_to do |format|
    	format.html { redirect_to current_user, notice: 'Friend is successfully added.' }
		end
	end

end
