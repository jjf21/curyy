class ApplicationController < ActionController::Base

	before_action :authenticate_user!
	before_action :set_theme

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def set_theme
		@theme_name = params[:theme_name] if params[:theme_name]
	end
end
