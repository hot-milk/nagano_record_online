class ArtistsController < ApplicationController
  before_action :admin_user
  
  def index
  	@artists = Artist.page(params[:page]).per(10)
  end

  def new
  	@artist = Artist.new
  end

  def create
  	artist = Artist.new(artist_params)
  	if artist.save
      flash[:notice] = "アーティストを登録しました。"
  	  redirect_to artists_path
    else
      flash[:notice] = "アーティストの登録に失敗しました。もう一度登録内容を確認してください。"
      render :new
    end
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    if artist.update(artist_params)
      flash[:notice] = "アーティスト情報を更新しました。"
      redirect_to artists_path
    else
      flash[:notice] = "アーティスト情報の更新に失敗しました。もう一度更新内容を確認してください。"
      render :edit
    end
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
