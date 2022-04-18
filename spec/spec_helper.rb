# frozen_string_literal: false

require "simplecov"

SimpleCov.start do
  add_filter "/spec/"
  add_filter "/config/"
  add_filter "/vendor/"
  add_group  "Models", "app/models"
  add_group  "Controllers", "app/controllers"
  add_group  "Helpers", "app/helpers"
  add_group  "Mailers", "app/mailers"
end

require "capybara/rspec"
require "selenium/webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_preference(:download, prompt_for_download: false,
                                  default_directory: "/tmp/downloads")

options.add_preference(:browser, set_download_behavior: { behavior: "allow" })

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
end

Capybara.register_driver :headless_chrome do |app|
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--window-size=1280,800")

  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)

  ### Allow file downloads in Google Chrome when headless!!!
  ### https://bugs.chromium.org/p/chromium/issues/detail?id=696481#c89
  bridge = driver.browser.send(:bridge)

  path = "/session/:session_id/chromium/send_command"
  path[":session_id"] = bridge.session_id

  bridge.http.call(:post, path, cmd: "Page.setDownloadBehavior",
                                params: {
                                  behavior: "allow",
                                  downloadPath: "/tmp/downloads",
                                })
  ###

  driver
end

Capybara.javascript_driver = :headless_chrome # :chrome for browser

Capybara.configure do |config|
  port = 9897
  config.app_host = "http://localhost:#{port}"
  config.asset_host = "http://localhost:#{port}" # for screenshots
  config.server_host = "localhost"
  config.server_port = port
  config.server = :puma, { Silent: true }
  config.disable_animation = true
  config.default_max_wait_time = 10
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each, js: true, debug: true) do
    Capybara.current_driver = :selenium_chrome
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
    ActionMailer::Base.deliveries.clear
  end

  config.after(:each, js: true, debug: true) do
    Capybara.use_default_driver
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:truncation)
    system "yarn build"
    system "yarn build:css"
    ActionController::Base.allow_forgery_protection = true
  end

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/tmp/storage"])
  end
end
