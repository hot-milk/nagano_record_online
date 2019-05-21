class OrderItemsController < ApplicationController

def create
	order_item = OrderItem.new(order_item_params)
	order_item.save
	redirect_to products_path
end

private
params.require(:order_item).permit(:order_id, :product_id, :order_item_number, :order_item_price)
end


end
