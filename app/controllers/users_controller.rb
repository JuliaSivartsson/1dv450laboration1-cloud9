class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Yay, your registration was successful"
      flash[:color] = "valid"
    else
      flash[:notice] = "Darn, something went wrong!"
      flash[:color] = "invalid"
    end
    render "new"
  end
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
