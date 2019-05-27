class ContactsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_user, :only => [:show, :index, :destroy]

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.save
			@user = contact.user
			ContactMailer.create_mail(@user).deliver
			flash[:notice] = 'お問い合わせありがとうございます。承りました。'
			redirect_to "/products"
		else
			flash[:danger] = '件名 内容を入力してください。'
			redirect_to "/products"
		end
	end

	def index
		@users = User.page(params[:page]).reverse_order
		@contacts = Contact.page(params[:page]).per(10).reverse_order
	end

	def show
		@user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
	end
# 問い合わせ返信
	def update
		@user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
		if @contact.update(contact_params)
			ContactMailer.contact_mail(@user).deliver
			flash[:notice] = '返信しました。'
			redirect_to "/contacts"
		end
	end

	def destroy
	    contact = Contact.find(params[:id])
	    contact.destroy
	    flash[:notice] = '削除しました。'
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