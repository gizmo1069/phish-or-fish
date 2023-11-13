Feature: Make changes to my scam post

  As a registered user
  I want to be able to create/edit/delete scam post

  Background: scams in database

    Given the following scams exist:
    | title        | category | zipcode     | description |
    |fake pikachu    | mobile     | 10011 |   mimikyu |
    | Wobuffet | email     | 10010 |   fake punching bag |
    | porygon        | mobile      |   10045 |   epiletic shock |
    | ditto     | social media     | 20920 |   it's ditto |

    Given I am a registered user
    When I visit the login page
    And I enter my email and password
    And I press "Log in"
    Then I should see "Signed in successfully."
    And I should see homepage has Post new scam
  
  Scenario: See specific scam information
    Given I am on the home page
    When I follow "Details for ditto"
    Then I should see "it's ditto"
    And I should not see "mimikyu"
    And I should see "Delete"
    And I should see "Edit"
  
  Scenario: Edit scam
    Given I am on the home page
    When I follow "Details for ditto"
    Then I click on "Edit"
    And I should see "Edit Existing Scam"
    And I update the scam post details
    And I click on "Update Scam Info"
    Then I should see the updated details of the scam post

  Scenario: Destroy scam
    Given I am on the home page
    When I follow "Details for ditto"
    Then I click on "Delete"
    Then I should see "All Scams"
    Then I should not see "it's ditto"

  Scenario: Create scam
    Given I am on the home page
    When I click on "Post new scam"
    Then I should see "Create New Scam"
    And I fill in the scam post details
    Then I click on "Save Changes"
    Then I should see "All Scams"
    Then I should see "New Scam Title"