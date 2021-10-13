class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user =  User.find_by_credentials(params[user][user_name], params[user][password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid password"]
      redirect_to new_sessions_url
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

end
