Feature: Update account information
  In order to keep my info up-to-date
  As a registered user
  I want to be able to update my account information

  Background:
    Given I am an authenticated user
    And I am on the edit account page

  Scenario: Update user information successfully
    When I submit my user information
    Then I should see "You updated your account successfully."
    And I should be on the home page

  Scenario: Wrong current password
    When I submit my user information with invalid current password
    Then I should see "is invalid" error for "user_current_password"
