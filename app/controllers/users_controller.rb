class UsersController < ApplicationController
	
	# GET /users/1
	def show
		@user = (User.find_by_id params[:id]) || current_user 
	end
	
	# GET /users/1
	def index
		@users = User.all
	end

	# POST /users/1
	def add_friend 
		friend = current_user.friends_lists.where friend_id: params[:id] 
		if !friend
			current_user.friends_lists.create params[:id]
			flag = true
    end
    respond_to do |format|
			if flag
				format.html { redirect_to current_user, notice: t(:friend_added) }
			else
				flash[:error] = ["Friend already exists"] 
				format.html { redirect_to current_user }	
			end
		end
	end
end