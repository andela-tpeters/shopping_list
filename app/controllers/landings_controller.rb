class LandingsController < ApplicationController
  def index
    @user = current_user if session[:user_id]
  end
end
