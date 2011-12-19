Feature: Update account information without current password
  In order to keep my info up-to-date
  As a registered user with out password b/c I was registered with my Twitter account
  I want to be able to update my account information

  Background:
    Given I am an authenticated user over Twitter

  # Scenario: User updates successfully full name without current password
  #   When I submit update account form without current password
  #   Then my account should be updated successfully

  Scenario: User sets password for account
    When I submit update account form with passwords but without current password
    Then my account should be updated successfully with new passwords
