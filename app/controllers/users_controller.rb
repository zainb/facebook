class UsersController < ApplicationController
	
	# GET /users/1
	def show
		@user = User.find params[:id] 
	end
	
	# GET /users/1
	def index
		@users = User.all
	end

	def add_friend
		@user = User.find params[:id] 
		current_user.friends_lists.where(:friend_id => @user.id).first_or_create
		respond_to do |format|
    	format.html { redirect_to current_user, notice: t(:friend_added) }
		end
	end

end
