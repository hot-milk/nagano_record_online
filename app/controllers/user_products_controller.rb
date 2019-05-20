class UserProductsController < ApplicationController

def index
	@user_product = UserProduct.where(user_id: current_user.id)
	# @price_total = @user_product.sum(:product_id.price)
end

def create
	@user_product = UserProduct.new(user_product_params)
    if @user_product.save
      flash[:notice] = "カートに商品が追加されました。"
    redirect_to products_path
    else
    redirect_to products_path
    end
end

def update
	user_product = UserProduct.find(params[:id])
	if user_product.update(user_product_params)
		flash[:notice2] = "数量を変更しました。"
	redirect_to user_products_path
    else
    render "/user_products"
end
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

end
