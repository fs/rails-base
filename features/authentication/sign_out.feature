Feature: As a logged in user
  I want to sign out
  To protect my identity

  Scenario: Logged in user signs out
    Given I am an authenticated user
    When I follow "Sign out"
    Then I should be on the sign in page
    And I should see "Signed out successfully."
