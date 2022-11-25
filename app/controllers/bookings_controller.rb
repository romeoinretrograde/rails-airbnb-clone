class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(pig_id: params[:pig_id])
    @pig = Pig.find(params[:pig_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pig = Pig.find(params[:pig_id])
    @booking.user = current_user

    if @booking.save
      redirect_to dashboard_path
    else
      render "pigs/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
