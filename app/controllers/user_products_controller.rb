class UserProductsController < ApplicationController
	before_action :find_my_order

def index
	@user_product = UserProduct.all
	@price_total = @user_product.sum(:product_id.price)
end

def create
	user_product = UserProduct.new(user_product_params)
	if user_product.save
	flash[:notice] = "カートに商品が追加されました。"
	redirect_to products_path
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
	params.require(:userproduct).permit(:product_id, :user_id, :user_product_number)
end

def find_my_order
	@user_product = UserProduct.where(user_id: current_user.id)
end

end
