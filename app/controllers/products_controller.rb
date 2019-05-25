class ProductsController < ApplicationController
  before_action :admin_user, except: [:index, :show, :search]

  def index
    @products = Product.page(params[:page])
    @contact = Contact.new
    product_favorite_count = Product.joins(:favorites).where(created_at: 1.weeks.ago..Time.now).group(:product_id).count
    product_favorited_ids = Hash[product_favorite_count.sort_by{ |_, v| -v }].keys
    @product_ranking= Product.where(id: product_favorited_ids).limit(10)
  end

  def search
    @products = Product.page(params[:page])
    @contact = Contact.new
    product_favorite_count = Product.joins(:favorites).where(created_at: 1.weeks.ago..Time.now).group(:product_id).count
    product_favorited_ids = Hash[product_favorite_count.sort_by{ |_, v| -v }].keys
    @product_ranking= Product.where(id: product_favorited_ids).limit(10)
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: params[:id])
    @user_product = UserProduct.new
    @contact = Contact.new
    @recorded_musics = RecordedMusic.where(product_id: params[:id]).order('recorded_disk_number ASC').order('recorded_music_number ASC').group_by(&:recorded_disk_number)
    product_favorite_count = Product.joins(:favorites).where(created_at: 1.weeks.ago..Time.now).group(:product_id).count
    product_favorited_ids = Hash[product_favorite_count.sort_by{ |_, v| -v }].keys
    @product_ranking= Product.where(id: product_favorited_ids).limit(10)
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
