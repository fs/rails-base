Feature: Sign in
  As a registerred user of the application
  I want to sign in

  Scenario: User sign in
    Given a user: "current_user" exists with email: "me@timurv.ru", password: "123456"
    When I go to the new user session page
    And I fill in "user_email" with "me@timurv.ru"
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should be on the home page
    And I should see "Signed in successfully."

  Scenario: User sign in with invalid credentials
    When I go to the new user session page
    And I fill in "user_email" with "me@timurv.ru"
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should see "Invalid email or password."
