source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

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
gem "slim-rails"
gem "simple_form"
gem "devise", "~> 4.8"
gem 'grover' # print html to pdf
gem 'acts_as_list' # help with ordering element
gem "lograge" #clear logs
gem "ahoy_matey" #analytics
gem "administrate"
gem "sentry-ruby" # error report
gem "sentry-rails" #error report



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
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "webdrivers"
end
