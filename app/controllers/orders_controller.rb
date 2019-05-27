class OrdersController < ApplicationController
	before_action :admin_user, except: [:new, :create]

def new
	@order = Order.new
	@order.order_items.build
	@user = User.find(current_user.id)
	@user_products = UserProduct.where(user_id: current_user.id)
	# カートに商品がなければアクセスできないようにする。
	if @user_products.count == 0
		flash[:notice] = "商品をカートに追加してください。"
		redirect_to root_path
	end
	@sum = 0

	@user_products.each do |user_product|
	  sub_total = user_product.product.price.to_i * user_product.user_product_number
	  @sum = @sum + sub_total
    end

    @total = @sum + 500
end

def create
	order = Order.new(order_params)
	user_products = UserProduct.where(user_id: current_user.id)
	order.user_id = current_user.id
	if order.save
    #購入時にカートの数量に合わせて在庫を減らす。
	user_products.each do |user_product|
	 	product = Product.find(user_product.product.id)
	 	quantity = product.stock.to_i - user_product.user_product_number.to_i
	 	product.update(stock: quantity.to_s )
	 end
	 user_products.delete_all
		if order.payment_method == "クレジットカード"
	    redirect_to order_path(order)
	    else
		flash[:notice] = "購入手続きが完了しました。"
		redirect_to products_path
		end
    else
      flash[:notice] = "入力した内容に不備があります。もう一度記載してください。"
      redirect_to new_order_path
    end

end

def index
	@orders = Order.page(params[:page]).per(10).reverse_order
end

def update
	order = Order.find(params[:id])
	order.update(order_params)
	redirect_to orders_path
end

def show
	@order = Order.find(params[:id])
end

def pay
	order = Order.where(user_id: current_user.id)
	order_last = order.last
    Payjp.api_key = 'sk_test_1b62936fcf06cb9f154c2453'
    charge = Payjp::Charge.create(
    :amount => order_last.total_price,
    :card => params['payjp-token'],
    :currency => 'jpy',
)
end

private

def order_params
	params.require(:order).permit(:user_id, :payment_method, :ship_status, :total_price, :order_ship_last_name, :order_ship_first_name, :order_ship_ruby_last_name, :order_ship_ruby_first_name, :order_ship_post_code, :order_ship_address, order_items_attributes: [:id, :order_id, :product_id, :order_item_number, :order_item_price, :_destroy])
end

end
