class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end

  def show
    @cake = Cake.find(params[:id])
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.user = current_user
    if @cake.save
      redirect_to @cake
    else
      render :new
    end
  end

  def edit
    @cake = Cake.find(params[:id])
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
    params.require(:cake).permit(:name, :description, :price, :size, photos: [])
  end
end
