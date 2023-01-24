class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit confirm cancel]
  before_action :set_licorne, only: %i[new create]

  def show
  end

  def new
    @booking = Booking.new 
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.licorne = @licorne
    @booking.user = current_user
    @booking.save
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.status = "canceled"
    @booking.save
    redirect_to dashboard_path()
  end

  def confirm
    @booking.status = "confirmed"
    @booking.save
    redirect_to dashboard_path()
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :user_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_licorne
    @licorne = Licorne.find(params[:licorne_id])
  end
end
