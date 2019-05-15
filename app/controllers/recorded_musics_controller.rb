class RecordedMusicsController < ApplicationController

	def create
	    product = Product.find(params[:product_id])
	    recorded_music = RecordedMusic.new(recorded_music_params)
	    recorded_music.product_id = Product.id
	    recorded_music.save
	    redirect_to products_path
	    binding.pry
	end

	private

	def recorded_music_params
	  params.require(:recorded_music).permit(
	                      :product_id,
	                      :recorded_music_name)
	end
end


