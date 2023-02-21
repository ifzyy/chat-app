class SessionController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back"
      redirect_to root_path
    else
      flash.now[:danger] = "Please enter correct username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have succesfully logged out"
    redirect_to login_path
  end


  def logged_in_redirect
   if logged_in?
    flash[:danger] = "You are already logged in"
    redirect_to root_path
  end
end
end
