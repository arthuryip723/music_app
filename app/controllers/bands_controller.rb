class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
