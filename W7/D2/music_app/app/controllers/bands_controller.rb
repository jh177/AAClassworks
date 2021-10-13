class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    if @band
      render :edit
    else
      flash.now[:errors] = ["Band not found"]
      redirect_to bands_url
    end
  end

  def update
    band = Band.find(params[:id])
    if band.update(band_params)
      redirect_to bands_url
    else
      flash[:errors] = band.errors.full_messages
      redirect_to bands_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
