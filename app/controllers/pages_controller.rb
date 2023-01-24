class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @pending_bookings = current_user.bookings.pending
    @confirmed_bookings = current_user.bookings.confirmed
    @requested_bookings = current_user.requested_bookings
    @canceled_bookings = current_user.bookings.canceled
  end
end
