class SessionsController < ApplicationController
  def new
  end

  def signin
    user = User.find_by email: allowed[:email]
    if user && (user.authenticate(allowed[:password]))
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else
      flash[:notice] = "User email/password combination incorrect"
      render :new
    end
  end

  private

  def allowed
    params.require(:user).permit(:email, :password)
  end
end
