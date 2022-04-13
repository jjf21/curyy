# frozen_string_literal: true

class ApplicationPublicController < ApplicationController
  protect_from_forgery with: :exception
  layout "application"
end
