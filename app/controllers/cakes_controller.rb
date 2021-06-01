class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @cake = Cake.find(params[:id])
    @cake.update(cake_params)
    redirect_to cake_path(@cake)
  end

  def destroy
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :price, :description, :size)
  end
end
