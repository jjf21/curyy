class ApplicationPublicController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
end
