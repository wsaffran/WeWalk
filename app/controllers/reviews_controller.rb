class ReviewsController < ApplicationController

  def new
    @user = User.find(user_params[:user_id])
    @review = Review.new
    render :new
  end

  def create
    @review = Review.create(review_params)
    @review.update(reviewer_id: current_user.id, reviewee_id: user_params[:user_id])
    redirect_to user_path(user_params[:user_id])
  end

  def destroy
    @review = Review.find((user_params.values).first)
    @review.destroy
    redirect_to user_path(@review.reviewee_id)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def user_params
    params.permit(:user_id)
  end

end
