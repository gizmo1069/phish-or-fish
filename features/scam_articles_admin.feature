Feature: Admin manage scam articles

  As an admin
  I want to add, edit, delete scam article

Background: articles in database

  Given the following articles exist:
  | title           | body      | author                    | published_at | category           |
  | fake Pikachu    | body1     | ditto                     | 10011        |   mobile           |
  | scamarticle     | body2     | FBI                       | 10010        |   email            |
  | porygon z       | body3     | CIA                       | 10045        |                    |  
  | ditto           | body4     | Columbia CS Advisign      | 20920        |  social media      |

  Given I am an admin user
  When I visit the login page
  And I enter my email and password of admin account
  And I press "Log in"
  Then I should see "Signed in successfully."

Scenario: Add new article
    Given I am on the scam articles page
    Then I should see "New Article"
    And I follow "New Article"
    Then I should see "New Scam Article"
    And I fill in the scam article details
    Then I click on "Submit"
    Then I should see "Social Media Scams was successfully created."
    Then I follow "Back"
    Then I should see "All Scam Articles"
    And I should see "Social Media Scams"

Scenario: Edit article
    Given I am on the scam articles page
    And I follow "Read article 'fake Pikachu'"
    Then I should see "body1"
    And I should see "Edit"
    Then I follow "Edit"
    Then I should see "Edit Scam Article"
    Then I fill in the scam article details
    Then I click on "Submit"
    Then I should see "Social Media Scams was successfully updated."
    Then I follow "Back"
    Then I should see "All Scam Articles"
    And I should see "Social Media Scams"
    And I should not see "fake Pikachu"