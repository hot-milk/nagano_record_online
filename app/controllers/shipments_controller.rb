class ShipmentsController < ApplicationController

def new
	@shipment=Shipment.new
end

def create
	shipment=Shipment.new(shipment_params)
	shipment.save
	redirect_to orders_path
end

private

def shipment_params
params.require(:shipment).permit(:user_id, :ship_last_name, :ship_first_name, :ship_ruby_last_name, :ship_ruby_first_name, :ship_postcode, :ship_address)
end

end
