class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:id])
		@contact.user_id = current_user.id
		if @contact.save
			flash[:success] = '送信されました'
			redirect_to "/products"
		else
			render "/users/sign_in"
		end
	end

	def index
		@contacts = Contact.page(params[:page]).reverse_order
	end

	def show
		@contact = Contact.find(params[:id])
	end
# 問い合わせ返信
	def update
		@contact = Contact.find(params[:id])
		@contact.user_id = current_user.admin
	end


	private
	def contact_params
		params.require(:contact).permit(:user_id, :contact_content, :responce)
	end
end
