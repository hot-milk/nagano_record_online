class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end


  private
  def contact_params
  	params.require(:contact).permit(:user_id, :contact_content, :responce)
  end
end