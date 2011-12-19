@webmock
Feature: Sign up with Twitter account
  In order to log into the system
  As a user
  I want to register a new account with the system with my Twitter account

  Scenario: User signs up with Twitter account
    When I follow Twitter link for sign up
    Then I should see form for completing registration over Twitter with prefilled fields
    When I submit registration over Twitter form with required fields
    Then I should be signed in
