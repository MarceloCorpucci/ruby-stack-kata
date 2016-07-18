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

	@wip
	Scenario Outline: Logged in user creates a blog entry with blanks
		When I create a blog entry with the title "<title>" and text "<text>"
		Then the message "<message>" should appear referring to the field

		Examples:
			| title 	| text 	 | message 				   |
			| 			| Hello! | This field is required. |
			| New Post  | 		 | This field is required. |