class OrdersController < ApplicationController

def new
	@order = Order.new
end

def create
	order = Oreder.new(order_params)
	if oreder.save
	flash[:notice] = "購入手続きが完了しました。"
	redirect_to orders_path
	else
    flash[:notice] = "必須項目を入力してください。" #各項目に合わせて後から修正
	redirect_to new_order_path
    end
end

def index
	@order = Order.all
end

private

def order_params
	params.require(:order).permit(:payment_method, :ship_status, :toatal_price, :order_ship_last_name, :order_ship_fisrt_name, :order_ship_ruby_last_name, :order_ship_ruby_first_name, :order_ship_postcode, :order_ship_adress)
end

end
