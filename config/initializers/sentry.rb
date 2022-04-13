# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = "https://6c70829e10194bf6a833424f1428faae@o566749.ingest.sentry.io/6325538"
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.environment = Rails.env
  config.traces_sample_rate = 1.0
end
