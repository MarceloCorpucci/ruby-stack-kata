Feature: Create blog entry

	Background: Prerequisites
		Given I have logged in with my credentials "admin1@gmail.com" and "admin1"
	
	Scenario: Logged in user creates a blog entry
		When I create a blog entry with the title "New entry" and text 
			"""
			Here we have some text about my new entry.
			See you!
			"""
		Then the message "Entry 'New entry' created successfully." should appear

    Scenario: Logged in user creates a blank blog entry
        When I create a blog entry with the title "New entry" and text ""
        Then the message "This field is required." should appear referring to the field

    Scenario: Logged in user creates a blog entry without title
        When I create a blog entry with the title "" and text "Hello!"
        Then the message "This field is required." should appear referring to the field 