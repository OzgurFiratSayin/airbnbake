class CakesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
    if params[:query].present?
      @cakes = Cake.search_by_name_description_user(params[:query])
    else
      @cakes = Cake.all
    end
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
    @user = User.find(Cake.find(params[:id]).user_id)
    @cake = Cake.find(params[:id])
    @cake.destroy if current_user == @cake.user
    redirect_to cakes_path
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size, photos: [])
  end
end
