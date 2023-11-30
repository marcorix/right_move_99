class FlatsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :set_flat, only: [:show, :like]

  def index
    @flats = Flat.all

  end

  def like
    if current_user.voted_up_on? @flat
      @flat.unvote_by current_user
    else
      @flat.upvote_by current_user
    end
    
    respond_to do |format|
      format.html do
        redirect_to flats_path
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@flat, partial: 'flats/flat', locals: {flat: @flat})
      end
    end
  end


  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save!
      redirect_to flats_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :guests, :price, :property_type, photos: [])
  end
end
