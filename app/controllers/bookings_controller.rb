class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pig = Pig.find(params[:pig_id])
    @booking.user = User.find(params[:user_id])

    if @booking.save
      redirect_to pig_path(@booking.pig)
    else
      render pig_path(@booking.pig), status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :pig_id, :user_id)
  end
end
