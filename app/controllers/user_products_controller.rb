class UserProductsController < ApplicationController
	before_action :authenticate_user!
	user_signed_in?
	before_action :admin_user
	current_user
	# before_action :find_my_order

def index
	@user_product = UserProduct.all
	@price_total = @user_product.sum(:product_id.price)
end

def create
	@user_product = UserProduct.new(user_product_params)
	if @user_product.blank?
	   @user_product = current_user.user_products.build(product_id: params[:product_id])
    @user_product.product_id += params[:id]
    @user_product.user_id = current_user.id
    end

    @user_product.user_product_number += params[:user_product_number].to_i
    if @user_product.save
      flash[:notice] = "カートに商品が追加されました。"
    redirect_to products_path
    else
      render "/products/show/@product.id"
    end
end

def update
	user_product = UserProduct.find(params[:id])
	user_product.apdate(user_product_params)
	redirect_to user_products_path
end

def destroy
	user_product = UserProduct.find(params[:id])
	user_product.destroy
	redirect_to user_products_path
end

private

def user_product_params
	params.require(:user_product).permit(:product_id, :user_id, :user_product_number)
end

def find_my_order
	@user_product = UserProduct.where(user_id: params[:id])
end

private
  #def user_params
    #params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :email, :postcode, :address, :phone, :encrypted_password)
  #end
  def admin_user
    puts "admin"
    puts current_user
      redirect_to(root_url) unless current_user.admin?
  end

end
