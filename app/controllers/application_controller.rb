class ApplicationController < ActionController::Base
<<<<<<< HEAD
	def after_sign_out_path_for(resource)
 		new_user_session_path
	end
=======

	before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_out_path_for(resource)
 		new_user_session_path
	end

	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end
>>>>>>> 956fc73964b25a71cc1ec659dda45c51f67518a5
end
