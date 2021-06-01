class CakesController < ApplicationController
  def index
  end

  def show
    @cake = Cake.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size, photos: [])
  end
end
