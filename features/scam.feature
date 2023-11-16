Feature: View scam information

  As a user
  I want to see all scam information


Background: scams in database

  Given the following scams exist:
  | title        | category | zipcode     | description |
  |fake pikachu    | phone     | 10011 |   mimikyu |
  | Wobuffet | email     | 10010 |   fake punching bag |
  | porygon        | phone      |   10045 |   epiletic shock |
  | ditto     | social media     | 20920 |   it's ditto |

  Given I am on the home page
  And I check the following categories: phone, email, social media

Scenario: View all scams (not logged in)
  Given I am on the home page
  Then I should see "fake pikachu"
  And I should see "Wobuffet"
  And I should see "porygon"
  And I should see "ditto"

Scenario: See specific scam information
  Given I am on the home page
  When I follow "Details for ditto"
  Then I should see "it's ditto"
  And I should not see "mimikyu"

Scenario: Share scam
  Given I am on the home page
  When I follow "Details for fake pikachu"
  Then I click on "Share"
  Then I should see the alert with the message "Share link: localhost:3000/scams/1"