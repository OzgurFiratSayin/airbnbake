class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @orders = @user.orders
    @cakes = @user.cakes
  end
end
