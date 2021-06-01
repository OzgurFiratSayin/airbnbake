class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end

  def show
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.save
    redirect_to cake_path(@cake)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cake_params
  params.require(:cake).permit(:name, :price, :description, :size)
  end
end
