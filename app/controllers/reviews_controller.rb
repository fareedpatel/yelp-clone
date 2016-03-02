class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  
  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    flash[:notice] = "Review submitted"
    redirect_to restaurants_path
  end
  
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
