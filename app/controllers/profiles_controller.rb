class ProfilesController < ApplicationController
  def show
    @user = User.includes(reviews: :movie).find_by(username: params[:id])
  end
end
