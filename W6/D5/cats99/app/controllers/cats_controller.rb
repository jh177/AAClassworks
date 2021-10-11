class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end
  
  def new
    @cat = Cat.new
    render :new
  end

  def create
    new_cat = Cat.new(cat_params)

    if new_cat.save
      redirect_to cats_url
      else
        render :new
      end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def updated
    @cat = Cat.find_by(id: params[:id])
    if user.update(user_params)
			redirect_to cat_url(@cat)#updated user
		else
			render :edit
		end
  end

  def cat_params
    params.require(:cat).permit(:name,:birth_date,:color,:sex,:description)
  end
end