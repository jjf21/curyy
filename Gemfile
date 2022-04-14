# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Default
ruby "3.1.1"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "bootsnap", require: false
gem "redis", "~> 4.0"
gem "jbuilder"
gem "sprockets-rails"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"

# Emails
gem "premailer-rails"

# Fundamentals
gem "slim-rails"
gem "simple_form"
gem "devise", "~> 4.8"

# SEO
gem "meta-tags"

# Services
gem "grover" # print html to pdf
gem "acts_as_list" # help with ordering element
gem 'cloudinary'

# i18n
gem "devise-i18n"

# Admin
gem "ahoy_matey"
gem "administrate"

# Logging
gem "sentry-ruby"
gem "sentry-rails"
gem "lograge"

group :development, :test do
  gem "byebug"
  gem "factory_bot_rails"
  gem "rspec_junit_formatter", require: false
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "launchy"
  gem "foreman"
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "tailwind_views_generator"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "rails-controller-testing"
  # gem "capybara-email"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "webdrivers"
end
