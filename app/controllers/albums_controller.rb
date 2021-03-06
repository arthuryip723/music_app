class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private
  def album_params
    params.require(:album).permit(:name, :category, :band_id)
  end
end
