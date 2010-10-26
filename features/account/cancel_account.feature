Feature: Cancel account
  When I do not want to use this service any more
  As a dissatisfied user
  I want to be able to cancel my account

  Background:
    Given I am an authenticated user
    And I am on the edit account page

  Scenario: Cancel user account
    When I follow "Cancel my account"
    Then I should be on the sign in page
    And my account should not be found
