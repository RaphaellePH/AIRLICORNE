class LicornesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_licorne, only: %i[show destroy edit update]

  def index
    @licornes = Licorne.all

    @markers = @licornes.map do |licorne|
      {
        lat: licorne.user.latitude,
        lng: licorne.user.longitude
      }
    end
  end

  def show
  end

  def new
    @licorne = Licorne.new
  end

  def create
    @licorne = Licorne.new(licorne_params)
    @licorne.user = current_user
    if @licorne.save
      redirect_to dashboard_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @licorne.destroy
    redirect_to licornes_path, status: :see_other
  end

  def edit
  end

  def update
    @licorne.update(licorne_params)
    redirect_to licorne_path(@licorne)
  end

  private

  def set_licorne
    @licorne = Licorne.find(params[:id])
  end

  def licorne_params
    params.require(:licorne).permit(:price, :name, :age, :superpower, :photo)
  end
end
