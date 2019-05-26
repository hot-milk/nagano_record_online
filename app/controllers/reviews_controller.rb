class ReviewsController < ApplicationController

	def new
	  @product = Product.find(params[:product_id])
	  @review = Review.new
	end

	def create
	  product = Product.find(params[:product_id])
	  review = Review.new(review_params)
	  review.product_id = product.id
	  if review.save
	  	flash[:notice] = "レビューを投稿しました。"
	    redirect_to product_path(product)
	  else
	  	flash[:notice] = "レビューの投稿に失敗しました。もう一度内容を確認してください。"
	  	render :new
	  end
	end

	def edit
	  @product = Product.find(params[:product_id])
	  @review = Review.find(params[:id])
	end

	def update
	  product = Product.find(params[:product_id])
	  review = Review.find(params[:id])
	  if review.update(review_params)
	  	flash[:notice] = "レビュー内容を更新しました。"
	    redirect_to product_path(product)
	  else
        flash[:notice] = "レビュー内容の更新に失敗しました。もう一度更新内容を確認してください。"
        render :edit
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