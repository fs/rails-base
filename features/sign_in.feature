Feature: Sign in
  As a registerred user of the application
  I want to sign in

  Scenario: User sign in
    Given I exist in the application as registered user
    When I go to the sign in page
    And submit my sign in informaion
    Then I should be signed in
    And I should be on the home page
    And I should see "Signed in successfully."

  Scenario: User sign in with invalid credentials
    When I go to the sign in page
    And submit invalid sign in informaion
    Then I should see "Invalid email or password."

  Scenario: User has not confirmed email address
    Given I exist in the application as registered user with not confirmed email
    When I go to the new user session page
    And submit my sign in informaion
    Then I should see "You have to confirm your account before continuing."

