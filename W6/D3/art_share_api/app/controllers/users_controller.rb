class UsersController < ApplicationController

  def index
    if params.has_key?(:username)
      name = params[:username].capitalize
      users = User.where(username: name)
    else
      users = User.all
    end
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422 #:unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end