class SubsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]
  before_action :require_moderator, only: [:edit, :update]

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = params[:user_id]
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ["Create Sub Failed"]
      redirect_to subs_url
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = sub.find(params[:id])
    if @sub.update(params)
      redirect_to subs_url
    else
      flash[:errors] = ["Update Failed"]
      redirect_to subs_url
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator
    redirect_to subs_url unless current_user.id == self.user_id
  end
end
