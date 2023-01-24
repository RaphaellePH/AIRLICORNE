class LicornesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @licornes = Licorne.all
  end

  def show
    @licorne = Licorne.find(params[:id])
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

  private

  def licorne_params
    params.require(:licorne).permit(:price, :name, :age, :superpower, :photo)
  end
end
