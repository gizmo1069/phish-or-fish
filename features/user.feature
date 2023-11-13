Feature: Login

  As a registered user
  I want to login to the website
  So that I can access member-only content
  I want to be able to create/edit/delete scam post

  Background: scams in database

    Given the following scams exist:
    | title        | category | zipcode     | description |
    |fake pikachu    | mobile     | 10011 |   mimikyu |
    | Wobuffet | email     | 10010 |   fake punching bag |
    | porygon        | mobile      |   10045 |   epiletic shock |
    | ditto     | social media     | 20920 |   it's ditto |

  Scenario: Successful login
    Given I am a registered user
    When I visit the login page
    And I enter my email and password
    And I press "Log in"
    Then I should see "Signed in successfully."
    And I should see homepage has Post new scam