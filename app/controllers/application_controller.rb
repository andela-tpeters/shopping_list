class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @user = User.find_by(id: session[:user_id])
    redirect_to(login_path) && return if @user.nil?
    @user
  end
end
