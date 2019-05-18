class ReviewsController < ApplicationController

	def new
	  @product = Product.find(params[:product_id])
	  @review = Review.new
	end

	def create
	  product = Product.find(params[:product_id])
	  review = Review.new(review_params)
	  review.product_id = product.id
	  review.save
	  redirect_to product_path(product)
	end

	def edit
	  @product = Product.find(params[:product_id])
	  @review = Review.find(params[:id])
	end

	def update
	  product = Product.find(params[:product_id])
	  review = Review.find(params[:id])
	  review.update(review_params)
	  redirect_to product_path(product)
	end

	def destroy
	  product = Product.find(params[:product_id])
	  review = Review.find(params[:id])
	  review.destroy
	  redirect_to product_path(product)
	end

  private

    def review_params
      params.require(:review).permit(:review_content,:user_id,:product_id)
    end

end