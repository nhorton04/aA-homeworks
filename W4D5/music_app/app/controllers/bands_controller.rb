class BandsController < ApplicationController
  def index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
    end
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:band).permit(:name)
  end
end
