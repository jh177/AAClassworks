class UsersController < ApplicationController

  before_action :require_logged_in, except: [:create, :new]
  before_action :require_logged_out, only: [:create, :new]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
