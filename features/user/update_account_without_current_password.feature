Feature: Update account information without current password
  In order to keep my info up-to-date
  As a registered user with out password b/c I was registered with my Twitter account
  I want to be able to update my account information

  Background:
    Given I exist in the application as registered over Twitter user
    And I am logged in with Twitter account
    And I am on the edit account page

  Scenario: Update user information successfully when registered without password and require current password after that
    When I submit my user information without current password
    Then I should see "You updated your account successfully."
    And I should be on the home page
    When I am on the edit account page
    And I submit my user information with invalid current password
    Then I should see "is invalid" error for "user_current_password"
