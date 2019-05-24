class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
	before_action :set_host


	def after_sign_out_path_for(resource)
 		new_user_session_path
	end

	def set_search
	  @search = Product.ransack(params[:q])
	  @search_products = @search.result.page(params[:page])
	end

	def set_host
      Rails.application.routes.default_url_options[:host] = request.host_with_port
  	end

  	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
    	 :ruby_last_name, :ruby_first_name, :postcode, :address, :phone ])
  	end
end
