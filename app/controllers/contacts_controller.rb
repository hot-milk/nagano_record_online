class ContactsController < ApplicationController
	before_action :authenticate_user!, only: []
	before_action :admin_user, :only => [:show, :index, :destroy]

	User2 = Struct.new(:name, :email)

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
		@users = User.page(params[:page]).reverse_order
		@contacts = Contact.page(params[:page]).reverse_order
	end

	def show
		@user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
	end
# 問い合わせ返信
	def update
		user = User2.new("name", "adtanaka.taro1111@gmail.com")
		@contact = Contact.new(contact_params)
		# @contact.update(contact_params)
		ContactMailer.contact_mail(user).deliver
		flash[:success] = '返信しました'
		redirect_to "/contacts"
	end

	def destroy
	    contact = Contact.find(params[:id])
	    contact.destroy
	    redirect_to '/contacts'
  	end


	private
	def contact_params
		params.require(:contact).permit(:user_id, :title, :contact_content, :responce)
	end
	def admin_user
      redirect_to(root_url) unless current_user.admin?
  	end
end
