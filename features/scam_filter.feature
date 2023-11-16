Feature: display list of scams filtered by category

  As a concerned 70 year old who is not technology savvy
  So that I can educate myself on the types of scams that I may fall victim to
  I want to see scams that only use certain methods of communication that I also use

Background: scams have been added to database

  Given the following scams exist:
  | title          | category      | zipcode    | description           |
  | fake pikachu   | phone         | 10011      |   mimikyu             |
  | Wobuffet       | email         | 10010      |   fake punching bag   |
  | porygon        | phone         | 10045      |   epiletic shock      |
  | ditto          | social media  | 20920      |   it's ditto          |

Scenario: restrict to movies with "phone" or "email" categories

  Given I am on the home page
  When I uncheck the following categories: social media
  And I press the "Refresh" button
  Then I should see the following scams: fake pikachu, Wobuffet, porygon
  And I should not see the following scams: ditto


Scenario: all ratings selected
  Given I am on the home page
  When I check the following categories: phone, email, social media
  And I press the "Refresh" button
  Then I should see all the scams