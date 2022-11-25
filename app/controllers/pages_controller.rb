class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pigs = Pig.all.sample(3)
  end

  def dashboard
    @pigs = Pig.select { |pig| pig.user_id == current_user.id }
    @bookings = Booking.select { |booking| booking.user_id == current_user.id }
  end
end
