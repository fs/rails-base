Feature: Update account information
  In order to keep my info up-to-date
  As a registered user
  I want to be able to update my account information

  Background:
    Given I am an authenticated user
    And I am on the edit account page

  Scenario: Update user information successfully
    When I fill in "Full name" with "Super Man"
    And fill in "Email" with "super@example.com"
    And fill in "Password" with "654321"
    And fill in "Password confirmation" with "654321"
    And fill in "Current password" with "123456"
    And press "Update"
    Then I should see "You updated your account successfully."
    And I should be on the home page

  Scenario: Wrong current password
    When I fill in "Full name" with "Super Man"
    And fill in "Email" with "super@example.com"
    And fill in "Password" with "654321"
    And fill in "Password confirmation" with "654321"
    And fill in "Current password" with "wrong password"
    And press "Update"
    Then I should see "is invalid" error for "user_current_password"
