class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    user =  User.find_by_credentials(params[user][user_name], params[user][password])
    if user
      log_in_user(user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid password"]
      redirect_to new_sessions_url
    end

  end

  def destroy
    log_out
    redirect_to new_sessions_url
  end

end
