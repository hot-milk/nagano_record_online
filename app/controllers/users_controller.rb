class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id || 
  		redirect_to user_path(@user.id)
  	end
  end
end
