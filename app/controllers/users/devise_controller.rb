class Users::DeviseController < ApplicationController
  class Responder < ActionController::Responder
    include Rails.application.routes.url_helpers

    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      elsif controller.class.to_s == "Devise::RegistrationsController" && request.method == "DELETE"
        # Fix delete account
        redirect_to root_path
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
