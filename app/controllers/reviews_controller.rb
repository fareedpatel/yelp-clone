class ReviewsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(current_user.id)
  end
  
  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    unless @restaurant.reviews.where(user_id: current_user.id).empty?
      flash[:notice] = "Restaurant already reviewed"
      redirect_to restaurants_path
    else
      @review = @restaurant.reviews.create(review_params)
      flash[:notice] = "Review submitted"
      redirect_to restaurants_path
  end
  end
  
  def review_params
    params.require(:review).permit(:comment, :rating, :user_id)
  end
end
