class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
