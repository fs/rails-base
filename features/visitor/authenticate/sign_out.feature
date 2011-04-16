Feature: Sign out
  In order to protect my identity
  As a registered user
  I want to sign out

  Scenario: Logged in user signs out
    Given I am an authenticated user
    When I follow "Sign out"
    Then I should be on the sign in page
    And I should see "Signed out successfully."
