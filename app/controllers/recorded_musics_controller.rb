class RecordedMusicsController < ApplicationController

	def create
<<<<<<< HEAD
	    product = Product.find(params[:product_id])
	    recorded_music = RecordedMusic.new(recorded_music_params)
	    recorded_music.product_id = Product.id
	    recorded_music.save
	    redirect_to products_path
	end

    def destroy
	    recorded_music = RecordedMusic.find(params[:id])
	    recorded_music.destroy
	    redirect_to edit_product_path
    end

	private

	def recorded_music_params
	  params.require(:recorded_music).permit(
						                      :product_id,
						                      :recorded_music_name,
						                      :recorded_music_number,
						                      :recorded_disk_number)
	end
=======
	end

    def destroy
	    product = Product.find(params[:product_id])
	    recorded_music = RecordedMusic.find_by(product_id:product.id)
	    recorded_music.destroy
	    redirect_to edit_product_path
    end
>>>>>>> 956fc73964b25a71cc1ec659dda45c51f67518a5
end


