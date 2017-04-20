class UsersController < ApplicationController
  before_action :check_that_not_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
    else
      flash.now[:errors] = ["Invalid username or password, CAAAAW"]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
