class OrderItemsController < ApplicationController

def create
	order = Order.find(params[:order_id])
	order_item = OrderItem.new(order_item_params)
	order_item.order_id = Order.id
	order_item.save
	redirect_to products_path
end

private

def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :order_item_number, :order_item_price)
    end


end
