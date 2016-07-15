Given(/^I have logged in with my credentials "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  @driver.navigate.to "https://effective-testing.herokuapp.com/"
    
  @driver.find_element(:id, 'login').click
  @driver.find_element(:id, 'email').send_keys arg1
  @driver.find_element(:id, 'password').send_keys arg2
  @driver.find_element(:id, 'btn-submit').click
end

When(/^I create a blog entry with the title "([^"]*)" and text$/) do |arg1, string|
  @driver.find_element(:id, 'create_post').click
  @driver.find_element(:id, 'title').send_keys arg1
  @driver.find_element(:id, 'body').send_keys string
  @driver.find_element(:id, 'tags').send_keys "abc"
  @driver.find_element(:id, 'post').click
end

Then(/^the message "([^"]*)" should appear$/) do |arg1|
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  wait.until { @driver.find_element(:id => 'notification').displayed? }

  expect(@driver.find_element(:id, 'notification').text).to include(arg1)
end