class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def admin
    @products = Product.all
  end

  def edit
  end

  def new
    @product = Product.new
    @product.recorded_musics.build
    p "================================"
    p @product
    p @product.recorded_musics
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to products_admin_path
    binding.pry
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_admin_path
  end

  private

  def product_params
    params.require(:product).permit(:artist_id,:genre_id, recorded_products_attributes: [:id, :recorded_music_name, :recorded_music_number, :recorded_disk_number, :_destroy])
  end
end
