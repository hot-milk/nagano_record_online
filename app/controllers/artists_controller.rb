class ArtistsController < ApplicationController
  before_action :admin_user
  
  def index
  	@artists = Artist.all
  end

  def new
  	@artist = Artist.new
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.save
  	redirect_to artists_path
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
