class ProductsController < ApplicationController
  before_action :admin_user, except: [:index, :show, :search]

  def index
    @products = Product.page(params[:page])
    @contact = Contact.new
  end

  def search
    @products = Product.page(params[:page])
    @contact = Contact.new
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: params[:id])
    @user_product = UserProduct.new
    @contact = Contact.new
    @recorded_musics = RecordedMusic.where(product_id: params[:id]).group_by(&:recorded_disk_number)
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
