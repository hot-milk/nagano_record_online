class UsersController < ApplicationController

  def index
     @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
  @user.save
  redirect_to user_path(@user.id)
  end

  def edit
  	@user = User.find(params[:id])
  	#if @user.id != current_user.id || @user.id != current_user.admin
  		#redirect_to user_path(@user.id)
  	#end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render "/users/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :postcode, :address, :phone, :encrypted_password)
  end

end
