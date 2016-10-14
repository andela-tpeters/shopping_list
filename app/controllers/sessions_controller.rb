class SessionsController < ApplicationController
  before_action :logged_in?, only: [:new]
  def new
  end

  def signin
    user = User.find_by email: allowed[:email]
    if user && (user.authenticate(allowed[:password]))
      flash[:notice] = "Login Successful"
      session[:user_id] = user.id
      redirect_to root_path and return
    else
      flash[:notice] = "User email/password combination incorrect"
      render :new
    end
  end

  def logout
    session.delete :user_id
    flash[:notice] = "Logout Successful"
    redirect_to root_path
  end

  private

  def allowed
    params.require(:user).permit(:email, :password)
  end

  def logged_in?
    if session[:user_id]
      flash[:notice] = "You are already logged in"
      redirect_to(root_path) && return
    end
  end
end
