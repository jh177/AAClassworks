class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, except: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
      # render json: "good"
      redirect_to user_url(@user)
    else
      render json: "Not found", status: 401
    end
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end





end
