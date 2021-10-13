class UsersController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in_user(user)
      redirect_to cats_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  #   if @user
  #     render :edit
  #   else
  #     flash.now[:errors] = ["User not found"]
  #     redirect_to cats_url
  #   end
  # end


  # def update
  #   user = User.find(params[:id])
  #   if user.update(user_params)
  #     redirect_to cats_url
  #   else
  #     flash[:errors] = user.errors.full_messages
  #     redirect_to cats_url
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
