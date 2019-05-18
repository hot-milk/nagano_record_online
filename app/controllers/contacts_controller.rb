class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.user_id = current_user.id
		if @contact.save
			flash[:success] = '送信されました'
			redirect_to "/products"
		else
			render "/users/sign_in"
		end
	end

	def index
<<<<<<< HEAD
=======
		@contact = Contact.new #あとで削除
>>>>>>> 956fc73964b25a71cc1ec659dda45c51f67518a5
		@contacts = Contact.page(params[:page]).reverse_order
	end

	def show
		@contact = Contact.find(params[:id])
	end
# 問い合わせ返信
	def update
		@contact = Contact.find(params[:id])
		@contact.user_id = current_user.admin
<<<<<<< HEAD
=======
		if @contact.update(contact_params)
			flash[:success] = '返信しました'
			redirect_to "/contacts"
		end
>>>>>>> 956fc73964b25a71cc1ec659dda45c51f67518a5
	end

	def destroy
	    @contact = Contact.find(params[:id])
	    @contact.destroy
	    redirect_to '/contacts'
  	end


	private
	def contact_params
<<<<<<< HEAD
		params.require(:contact).permit(:user_id, :contact_content, :responce)
=======
		params.require(:contact).permit(:user_id, :title, :contact_content, :responce)
>>>>>>> 956fc73964b25a71cc1ec659dda45c51f67518a5
	end
end
