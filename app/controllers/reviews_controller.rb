class ReviewsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat = @flat
    @review.user = current_user

    if @review.save
        format.html { redirect_to flat_path(@flat)}
        format.json    
    else
        format.html { render "monuments/new", status: :unprocessable_entity }
        format.json
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
