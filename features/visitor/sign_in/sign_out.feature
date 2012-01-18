Feature: Sign out
  In order to protect my identity
  As a registered user
  I want to sign out

  Scenario: Logged in user signs out
    Given I am signed in
    When I sign out
    Then I should be signed out