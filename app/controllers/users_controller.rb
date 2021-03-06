class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the DivvyUp!"
      sign_in @user
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
