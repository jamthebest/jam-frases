class SessionsController < ApplicationController
  def create
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Username or password is invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end
end
