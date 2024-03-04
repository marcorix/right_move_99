class BookingsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat
    if @booking.save!
      flash[:notice] = "You book #{@booking.flat.name}"
      redirect_to dashboard_path
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: 303
    # respond_to do |format|
    #   format.html {redirect_to dashboard_path}
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
