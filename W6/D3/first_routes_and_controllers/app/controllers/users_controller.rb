class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
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
end