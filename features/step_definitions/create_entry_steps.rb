Given(/^I have logged in with my credentials "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  @home = PageObjects::HomePage.new
  @home.load

  @home.go_to_login.login_with arg1, arg2
end

When(/^I create a blog entry with the title "([^"]*)" and text "([^"]*)"$/) do |arg1, arg2|
  @post_form = @home.go_to_create_post
  @post_form.post arg1, arg2
end

Then(/^the message "([^"]*)" should appear referring to the field$/) do |arg1|
  expect(@post_form.message_is(arg1)).to eq(true)
end