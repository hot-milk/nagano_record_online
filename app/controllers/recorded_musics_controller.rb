class RecordedMusicsController < ApplicationController

	def create
	end

    def destroy
	    product = Product.find(params[:product_id])
	    recorded_music = RecordedMusic.find_by(product_id:product.id)
	    recorded_music.destroy
	    redirect_to edit_product_path
    end
end


