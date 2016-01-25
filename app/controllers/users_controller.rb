class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to @user
    else
      flash[:danger] = "An error occurred"
      render 'new'
    end
  end

  def show
    verify_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
