Feature: Sign up
  In order to log into the system
  As a user
  I want to register a new account with the system

  Scenario: User signs up
    When I go to the sign up page
    And I submit my registration information
    Then I should receive an email with a link to a confirmation page
    And I should be on the sign in page
    When I click on the confirmation link in the confirmation email
    Then I should be signed in
    And I should be on the home page


  Scenario: User signs up with invalid date
    When I go to the sign up page
    And I submit invalid registration information
    Then I should see errors for the registration information
