class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @flats = Flat.all
  end
end