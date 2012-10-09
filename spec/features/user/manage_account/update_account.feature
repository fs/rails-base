Feature: Update account information
  In order to keep my info up-to-date
  As a registered user
  I want to be able to update my account information

  Background:
    Given I am signed in

  Scenario: Update user information successfully
    When I submit update account form with valid data
    Then my account should be updated successfully

  Scenario: Wrong current password
    When I submit update account form with valid data but with wrong current password
    Then my account should not be updated
