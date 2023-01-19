class PagesController < ApplicationController
  def home
  end

  def login
  end

  def dashboard
    @booking_requests = Booking.where(booking.licorne.user == current_user && booking.status == "pending")
    @confirmed_bookings = Booking.where(booking.licorne.user == current_user && booking.status == "confirmed")
    @my_booking_requests = Booking.where(booking.user == current_user)
  end
end
