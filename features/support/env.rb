require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'site_prism'
require_relative '../../test_commons/all_page_objects'

if ENV['HEADLESS']
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
  	  js_errors: false,
      debug: false,
      window_size: [1280, 1024],
      phantomjs_options: ['--ignore-ssl-errors=yes', '--local-to-remote-url-access=yes']
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
  
else
  Capybara.default_driver = :selenium
  Capybara.page.driver.browser.manage.window.maximize
end

Capybara.configure do |config|
  config.run_server = false
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

Before do
  Capybara.app_host = "https://effective-testing.herokuapp.com/"
end
