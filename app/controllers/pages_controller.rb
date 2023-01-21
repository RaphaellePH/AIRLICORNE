class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @pending_bookings = current_user.bookings.pending
    @confirmed_bookings = current_user.bookings.confirmed
    @requested_bookings = current_user.requested_bookings

    # @confirmed_requests = Booking.all.where(licorne.user = current_user && status == "confirmed")
    # @my_booking_requests = Booking.all.where(user == current_user)
  end
end
