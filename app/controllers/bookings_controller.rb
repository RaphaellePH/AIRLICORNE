class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_licorne, only: [:new, :create]

  def show
    @booking = Booking.find(params[:id])
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
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path()
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_licorne
    @licorne = Licorne.find(params[:licorne_id])
  end
end
