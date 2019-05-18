class OrdersController < ApplicationController

def new
	@order = Order.new
	@shipment = Shipment.new
	@user = User.find(params[:id])
end

def create
	order = Oreder.new(order_params)
	shipment = Shipment.new(shipment_params)
	if oreder.save && shipment.save
	flash[:notice] = "購入手続きが完了しました。"
	redirect_to orders_path
	else
    flash[:notice] = "必須項目を入力してください。" #各項目に合わせて後から修正
	redirect_to new_order_path
    end
end

def show
	@order = Order.find(params[:id])
	@user = User.find(params[:id])
end

def index
	@order = Order.all

private

def order_params
	params.require(:order).permit(:payment_method, :ship_status, :total_price, :order_ship_last_name, :order_ship_fisrt_name, :order_ship_ruby_last_name, :order_ship_ruby_first_name, :order_ship_postcode, :order_ship_adress)
end

def shipment_params
	params.require(:shipment).permit(:user_id, :ship_last_name, :ship_first_name, :ship_ruby_last_name, :ship_ruby_first_name, :ship_postcode, :ship_address)
end

end
