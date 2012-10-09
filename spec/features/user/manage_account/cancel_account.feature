Feature: Cancel account
  I order to delete my private information from the system
  As a registered user
  I want to be able to cancel my account

  Background:
    Given I am signed in

  Scenario: Cancel user account
    When I cancel my account
    Then I should be signed out 
    And my account should not exists
