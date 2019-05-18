class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def search
  end

  def show
  end

  def admin
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
    @recorded_musics = RecordedMusic.where(product_id: params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to products_admin_path
  end

  def new
    @product = Product.new
    @product.recorded_musics.build
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to products_admin_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_admin_path
  end

  private

  def product_params
    params.require(:product).permit(:product_name,
                                    :artist_id,
                                    :genre_id,
                                    :label_id,
                                    :product_category,
                                    :jacket_image,
                                    :price,
                                    :stock,
                                    :status,
                                    recorded_musics_attributes: [:id, :product_id, :recorded_music_name, :recorded_music_number, :recorded_disk_number, :_destroy])
  end
end
