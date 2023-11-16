Feature: User login and register

  As a registered user
  I want to login to the website

  As a new user
  I want to sign up for an account

  Scenario: Successful login
    Given I am a registered user
    When I visit the login page
    And I enter my email and password
    And I press "Log in"
    Then I should see "Signed in successfully."

  Scenario: Succesful signup
    When I visit the sign up page
    And I enter my signup info
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    And I should see "Logout"

