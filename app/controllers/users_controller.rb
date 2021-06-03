class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @orders = @user.orders
    @cakes = @user.cakes
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
