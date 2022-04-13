# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "contact@curyy.com", reply_to: "contact@curyy.com"
  layout "mailer"
end
