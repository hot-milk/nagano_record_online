class UserProductsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user_product = UserProduct.where(user_id: current_user.id)
		@sum = 0
		@user_product.each do |user_product|
		sub_total = user_product.product.price.to_i * user_product.user_product_number
		@sum = @sum + sub_total
        end
	end

	def create
		@user_product = UserProduct.new(user_product_params)
	    if @user_product.user_product_number <= @user_product.product.stock
	       @user_product.save
	       flash[:notice] = "カートに商品が追加されました。"
	       redirect_to user_products_path
	   else
	   	   flash[:notice] = "在庫が不足しております。申し訳ありませんが、数量を変更して再度お試しください。"
	   	   redirect_to product_path(@user_product.product_id)
	    end
	end

	def update
		user_product = UserProduct.find(params[:id])
		user_product.assign_attributes(user_product_params)
		if user_product.user_product_number <= user_product.product.stock
		  user_product.update(user_product_params)
		  flash[:notice] = "数量を変更しました。"
		  redirect_to user_products_path
	    else
	      flash[:notice] = "在庫が不足しております。申し訳ありませんが、数量を変更して再度お試しください。"
	      redirect_to user_products_path
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
