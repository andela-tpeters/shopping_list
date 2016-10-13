class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create allowed
    if @user.errors.empty?
      flash[:notice] = "Registration Successful"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Registration Failed"
      render :new
    end
  end

  private

  def allowed
    params.permit :email, :password, :password_confirmation
  end
end
