class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def noti
  	@noti = (Notification.where para: current_user).where leido: false
  end

  def messa
    @messa = (Message.where para: current_user).where leido: false
  end

  helper_method :current_user, :logged_in?, :noti, :messa
end
