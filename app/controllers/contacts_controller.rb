class ContactsController < ApplicationController
	before_action :authenticate_user!, only: []
	before_action :admin_user, :only => [:show, :index, :destroy]
	def new
		@user = User.find(params[:user_id])
		@contact = Contact.new
	end

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.save
			flash[:success] = '送信されました'
			redirect_to "/products"
		else
			render "/users/sign_in"
		end
	end

	def index
		if current_user.admin?#仮if文
			@users = User.page(params[:page]).reverse_order
			@contacts = Contact.page(params[:page]).reverse_order
		else
			redirect_to '/products'
		end
	end

	def show
		if current_user.admin?#仮if文
			@user = User.find(params[:user_id])
			@contact = Contact.find(params[:id])
		else
			redirect_to '/products'
		end
	end
# 問い合わせ返信
	def update
		user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
		if @contact.update(contact_params)
			ContactMailer.contact_mail(@contact).deliver#Mailer呼び出し
			flash[:success] = '返信しました'
			redirect_to "/contacts"
		end
	end

	def destroy
		if current_user.admin?#仮if文
		    contact = Contact.find(params[:id])
		    contact.destroy
		    redirect_to '/contacts'
		else
			redirect_to '/products'
		end
  	end


	private
	def contact_params
		params.require(:contact).permit(:user_id, :title, :contact_content, :responce)
	end
	def admin_user
      redirect_to(root_url) unless current_user.admin?
  	end
end
