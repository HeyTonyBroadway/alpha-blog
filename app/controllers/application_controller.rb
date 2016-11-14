class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # any methods in ApplicationController are available to all controllers, but not views by default
  
  #the helper_method makes them available to views
  helper_method :current_user, :logged_in?

  def current_user #the ||= means look for current_user, but IF NOT, create current_user
  					# This is so that we don't always have the database looking for current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in? # !! means convert current_user to a boolean..if current_user this method returns true
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to root_path
  	end
  end
end
