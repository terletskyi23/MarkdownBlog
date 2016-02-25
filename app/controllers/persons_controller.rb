class PersonsController < ApplicationController
  def profile
  end

  def show
  	@user = User.find(params[:id])
  end

  def myfollow
    @user = current_user # before_action :authenticate_user, only: [:likes]
    @folowing_user = User.find(params[:id])
    @user.toggle_myfollow(@folowing_user)

    if @user.following?(@folowing_user) 
      redirect_to :back, notice: "You follow this user!"
    else
      redirect_to :back, notice: "You unfollow this user!"
    end
  end

end
