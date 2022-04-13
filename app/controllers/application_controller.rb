class ApplicationController < ActionController::Base

	before_action :authenticate_user!
	before_action :set_theme, if: :updating_cvs_live
	before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def set_theme
		p request.format.to_s
		@cv = Cv.includes(:theme).find_by(id: params[:cv_id])
		@theme_name = @cv.theme.name if @cv
	end

	def after_sign_in_path_for(resource)
	  current_user.admin? ? admin_root_path : cvs_path
	end

	private

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
	end

	def updating_cvs_live
		["cvs", "experiences", "skills", "users"].include?(controller_path) &&
			request.format == "text/vnd.turbo-stream.html"
	end
end
