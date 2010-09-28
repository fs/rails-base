Feature: As a logged in user
  I want to sign out
  To protect my identity

  Scenario: Logged in user signs out
    Given I am logged in as "me@timurv.ru/123456"
    When I follow "Sign out"
    Then I should be on the new user session page
    And I should see "Signed out successfully."
