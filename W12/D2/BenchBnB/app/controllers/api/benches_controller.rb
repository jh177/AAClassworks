class Api::BenchesController < ApplicationController
  
  def index
    bounds = params[:bounds]
    if bounds
      @benches = Bench.in_bounds(bounds)
    else
      @benches = Bench.all
    end
    render :index
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 401
    end
  end

  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end

end
