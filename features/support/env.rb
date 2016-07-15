require 'selenium-webdriver'
require_relative "../../test_commons/support"

include Support
include CleanUp

Before do
  configure_default_driver
end

After do
  delete_entry
  @driver.quit
end