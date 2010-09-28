Feature: Update account information
  In order to keep my info up-to-date
  As a user
  I want to be able to update my account information

  Scenario: Update user information successfully
    Given I am an authenticated user
    And I am on the edit account page
    When I submit my user information
    Then I should see "You updated your account successfully."
    And I should be on the home page

  Scenario: Wrong current password
    Given I am an authenticated user
    And I am on the edit account page
    When I submit my user information with invalid current password
    Then I should see "is invalid" error for "user_current_password"

  Scenario: Cancel user account
    Given I am an authenticated user
    And I am on the edit account page
    When I follow "Cancel my account"
    Then I should be on the sign in page
    And my account should not be found
