Feature: Login

  As a registered user
  I want to login to the website
  So that I can access member-only content

  Scenario: Successful login
    Given I am a registered user
    When I visit the login page
    And I enter my email and password
    And I press "Log in"
    Then I should see "Signed in successfully."
    And I should see homepage has Post new scam