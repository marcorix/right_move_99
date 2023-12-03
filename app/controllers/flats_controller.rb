class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_flat, only: [:show]

  def map
    @flats = Flat.all
    
    if params[:query].present?
      @flats = Flat.search_by_name_and_address_and_property_type(params[:query])
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end

  end

  def index
    @flats = Flat.all
    if params[:query].present?
      @flats = Flat.search_by_name_and_address_and_property_type(params[:query])
    end
  end

  def show
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
