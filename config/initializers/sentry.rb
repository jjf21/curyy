# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV["SENTRY_DSN"] || ""
  config.environment = Rails.env
  config.enabled_environments = ["production"]
end
