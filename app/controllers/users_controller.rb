class UsersController < ApplicationController
  before_action :authenticate_user!, only: []
  before_action :admin_user
  #before_action :user_signed_in
  #current_user
  #user_session #多分いら



  def index
    if current_user.admin?#仮if文
      @users = User.page(params[:page]).reverse_order
    else
      redirect_to '/products'
    end
  end

  def show
    user = User.find(1)
    user.admin = true
    user.save
    @user = User.find(params[:id])
    #@userに紐付いているordersをkaminari式で
    @orders = @user.orders.page(params[:page]).reverse_order
    #仮
    #@items = @user.orders.orders_items.page(params[:page]).reverse_order
    #if (current_user.admin?) || (current_user.id == @user.id)#仮if文
    #  redirect_to users_path(@user.id)
    #else
    #  redirect_to '/products'
    #end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
    if current_user.admin? || current_user.id == @user.id
      redirect_to user.path(@user.id)
    else
      redirect_to '/products'
    end
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
    if current_user.admin?
      redirect_to '/users'
    else
      redirect_to new_user_session_path
    end
  end


private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :email, :postcode, :address, :phone, :encrypted_password, shipments_attributes: [:user_id, :ship_last_name, :ship_first_name, :ship_ruby_last_name, :ship_ruby_first_name, :ship_postcode, :ship_address])
  end
  def admin_user
    
      redirect_to(root_url) unless current_user.admin?
  end


end
