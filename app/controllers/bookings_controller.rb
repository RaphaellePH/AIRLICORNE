class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_licorne, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to dashboard_path()
      # message pop up "reservation validée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path()
    # message pop up "reservation annulée"
  end

  private

  def booking_params
    params.require(:booking)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_licorne
    @licorne = Licorne.find(params[:licorne_id])
  end

  def set_user
    @user = current_user
  end
end
