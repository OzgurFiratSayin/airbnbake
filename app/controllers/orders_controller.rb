class OrdersController < ApplicationController
  def new
    @cake = Cake.find(params[:cake_id])
    @order = Order.new
  end
  
  def create
    @cake = Cake.find(params[:cake_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.cake = @cake
    if @order.save
      redirect_to cake_path(@cake)
    else
      render :new
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @cake = Cake.find(@order.cake_id)
    @order.destroy
    redirect_to cake_path(@cake)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_date, :user_id, :cake_id)
  end
end
