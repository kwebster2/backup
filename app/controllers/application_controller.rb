class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method :logged_in?
  # helper_method :current_user
  # before_action :verified_user
  
  # def verified_user
  #   redirect_to '/' unless logged_in?
  # end 

  # def logged_in?
  #   !!current_user
  # end

  def current_user
    User.find(session[:user_id])
  end
end
