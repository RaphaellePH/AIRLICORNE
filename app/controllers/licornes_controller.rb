class LicornesController < ApplicationController
  def index
    @licornes = Licornes.all
  end

  def show
    @licorne = Licorne.find(params[:id])
  end

  def new
    @licorne = Licorne.new
  end

  def create
    @licorne = Licorne.new(licorne_params)
    if @licorne.save
      redirect_to licorne_path(@licorne)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @licorne.destroy
    redirect_to licornes_path, status: :see_other
  end

  private

  def licorme_params
    params.require(:licorne).permit(:price, :name, :age, :superpower)
  end
end
