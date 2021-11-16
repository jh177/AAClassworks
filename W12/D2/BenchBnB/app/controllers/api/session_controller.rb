class Api::SessionController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )
    if @user
      sign_in(@user)
      render 'api/users/show'
    else
      render json: ['Invalid credentials'], status: 401
    end
  end

  def destroy
    if current_user.nil
      render json: ['no user logged in'], status: 404
    else
      sign_out
      render json: {message: "Logout successful."}
    end
   
  end

end
