Feature: View scam articles

  As a normal user
  I want to see all scam articles
  I should not have access to add/edit/delete articles

Background: articles in database

  Given the following articles exist:
  | title           | body      | author                    | published_at | category           |
  | fake Pikachu    | body1     | ditto                     | 10011        |   mobile           |
  | scamarticle     | body2     | FBI                       | 10010        |   email            |
  | porygon z       | body3     | CIA                       | 10045        |                    |  
  | ditto           | body4     | Columbia CS Advisign      | 20920        |  social media      |

Scenario: View all scam articles
    Given I am on the scam articles page
    Then I should see "scamarticle"
    And I should see "fake Pikachu"
    And I should see "porygon z"
    And I should see "ditto"
    And I should not see "New Article"

Scenario: Read particular article
    Given I am on the scam articles page
    And I follow "Read article 'porygon z'"
    Then I should see "body3"
    And I should not see "Edit"
    And I should not see "Delete"

