class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :only => [:get_answer]

  def set_username
  	@username = session[:username]
  end

  def check_session
  	return true unless @username != session[:username]
  end
end
