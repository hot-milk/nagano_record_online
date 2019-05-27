class GenresController < ApplicationController
  before_action :admin_user
  
  def index
  	@genres = Genre.page(params[:page])
  end

  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
      flash[:notice] = "ジャンルを登録しました。"
  	  redirect_to genres_path
    else
      flash[:notice] = "ジャンルの登録に失敗しました。もう一度登録内容を確認してください。"
      render :new
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル情報を更新しました。"
      redirect_to genres_path
    else
      flash[:notice] = "ジャンル情報の更新に失敗しました。もう一度更新内容を確認してください。"
      render :edit
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end