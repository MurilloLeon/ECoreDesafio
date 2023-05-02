# encode: UTF-8

@login
Feature: LOGIN, login according to the different scenarios.

@regression
Scenario: Validate if the user can authenticate in the application with the credentials provided
  Given that I have entered the application site
  And that I have filled in my login credentials correctly
  When i click on the "button_login" button
  Then I should validate that I have been successfully authenticated.

@sad_scenario
Scenario Outline: Validate that the application denies the user login with invalid credentials
  Given that I have entered the application site
  And I attempt to login with <login_field> and <password_field>
  When i click on the "button_login" button
  Then I should see an element with an error message text appear

Examples:
	| login_field               | password_field       |
	| "username_demo_capslock"  | "correct_password"   |
	| "incorrect_username_demo" | "correct_password"   |
	| "username_demo"           | "incorrect_password" |
  | "username_demo"           | "empty_password"     |