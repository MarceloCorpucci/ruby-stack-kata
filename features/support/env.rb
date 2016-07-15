require 'selenium-webdriver'
require_relative "../../test_commons/support"

include Support
include CleanUp

Before do
  configure_default_driver
end

After do |scenario|
  if scenario.name == "Logged in user creates a blog entry"
    delete_entry
  end
  
  @driver.quit
end