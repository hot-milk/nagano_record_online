class UsersController < ApplicationController
  before_action :authenticate_user!, only: []
  before_action :admin_user
  user_signed_in?

  current_user
  #user_session #多分いらん！

  def index
     @users = User.page(params[:page]).reverse_order
  end

  def show
    user = User.find(1)
    user.admin = true
    user.save
    @user = User.find(params[:id])
    #@userに紐付いているordersをkaminari式で
    @orders = @user.orders.page(params[:page]).reverse_order
    #仮
    @items = @user.orders.orders_items.page(params[:page]).reverse_order
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
    params.require(:user).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :email, :postcode, :address, :phone, :encrypted_password)
  end
  def admin_user
    puts "admin"
    puts current_user
      redirect_to(root_url) unless current_user.admin?
  end


end
