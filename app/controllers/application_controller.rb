class ApplicationController < ActionController::Base
  protect_from_forgery 
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(user)
    users_path(user)
  end
end
