Feature: Sign in
  In order to identify myself in the system
  As a registered user
  I want to sign in

  Scenario: User signs in
    Given I exist in the application as registered user
    When I go to the sign in page
    And submit my sign in information
    Then I should be signed in
    And I should be on the home page
    And I should see "Signed in successfully."

  Scenario: User signs in with invalid credentials
    When I go to the sign in page
    And submit invalid sign in information
    Then I should see "Invalid email or password."

  Scenario: User has not confirmed email address
    Given I exist in the application as registered user with not confirmed email
    When I go to the new user session page
    And submit my sign in information
    Then I should see "You have to confirm your account before continuing."

  Scenario: User forgets his password
    Given I exist in the application as registered user
    And I go to the send password instructions page
    When I submit send password instructions form
    Then I should receive an email with a link to a password instructions page
