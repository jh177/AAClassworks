class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  

end