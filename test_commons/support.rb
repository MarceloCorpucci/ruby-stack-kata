module Support
  def configure_default_driver
  	@driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 10
    @driver.manage.window.maximize
  end
end

module CleanUp
  def delete_entry
  	@driver.navigate.to "https://effective-testing.herokuapp.com/admin"
  	@driver.find_element(:xpath, '/html/body/div/div[1]/div/ul[1]/li[2]/a').click
  	@driver.find_element(:xpath, '/html/body/div/table/tbody/tr[3]/td[2]/form/button/i').click
  	@driver.switch_to.alert.accept
  end
end