class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, except: [:show, :edit, :update]

  def index
     @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    #unless current_user.admin?
    if @user.id == current_user.id
    elsif current_user.admin?
    else
        redirect_to user_path(current_user)
    end
    @orders = Order.where(user_id: params[:id]).page(params[:page]).per(2).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id == current_user.id
    elsif current_user.admin?
    else
        redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to root_path
    end
  end
end


private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :email, :postcode, :address, :phone, :encrypted_password)
  end
end
