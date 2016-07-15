Feature: Create blog entry

	Scenario: Logged in user creates a blog entry
		Given I have logged in with my credentials "admin1@gmail.com" and "admin1"
		When I create a blog entry with the title "New entry" and text 
			"""
			Here we have some text about my new entry.
			See you!
			"""
		Then the message "Entry 'New entry' created successfully." should appear