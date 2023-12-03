class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    @review.user = current_user

    if @review.save!
      redirect_to flat_path(@flat)
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :reting)
  end
end
