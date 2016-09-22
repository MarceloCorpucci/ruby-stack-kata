require "minitest/autorun"
require "selenium-webdriver"
require_relative "../test_commons/support"

class TestBlog < Minitest::Test
  include Support
  include CleanUp
  
  def setup
  	configure_default_driver
  end

  def teardown
    delete_entry

  	@driver.quit
  end

  def test_that_logged_in_user_is_able_to_post
    @driver.navigate.to "localhost:5000/"
    
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'email').send_keys "admin1@gmail.com"
    @driver.find_element(:id, 'password').send_keys "admin1"
    @driver.find_element(:id, 'btn-submit').click

    @driver.find_element(:id, 'create_post').click
    @driver.find_element(:id, 'title').send_keys "New post"
    @driver.find_element(:id, 'body').send_keys "Here we have some text."
    @driver.find_element(:id, 'tags').send_keys "abc"
    @driver.find_element(:id, 'post').click

    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    wait.until { @driver.find_element(:id => 'notification').displayed? }

    assert_equal @driver.find_element(:id, 'notification').text.include?("Entry 'New post' created successfully."), true
  end
end
