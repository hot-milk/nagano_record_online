class UserProductsController < ApplicationController
	before_action :authenticate_user!

	#user_signed_in?
	#before_action :admin_user
	#current_user
	# before_action :find_my_order
  
def index
	@user_product = UserProduct.where(user_id: current_user.id)
	# @price_total = @user_product.sum(:product_id.price)
end

def create
	@user_product = UserProduct.new(user_product_params)
    if @user_product.product.stock.to_i > 0
       @user_product.save
       flash[:notice] = "カートに商品が追加されました。"
       redirect_to user_products_path
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


  #def user_params
    #params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :email, :postcode, :address, :phone, :encrypted_password)
  #end
  #def admin_user
      #redirect_to(root_url) unless current_user.admin?
  #end

end
