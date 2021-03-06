class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end
  
  def create
    @order = Order.find(params[:order_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.order = @order
    if @review.save
      redirect_to cake_path(@order.cake)
    else
      render :new
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :cake_id)
  end
end
