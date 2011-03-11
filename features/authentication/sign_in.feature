Feature: Sign in
  In order to identify myself in the system
  As a registered user
  I want to sign in

  Scenario: User signs in
    Given a confirmed user exists with email: "me@example.com", password: "123456"
    When I go to the sign in page
    And fill in "Email" with "me@example.com"
    And fill in "Password" with "123456"
    And press "Sign in"
    Then I should be signed in
    And I should be on the home page
    And I should see "Signed in successfully."

  Scenario: User signs in with invalid credentials
    When I go to the sign in page
    And fill in "Email" with "invalid email"
    And fill in "Password" with "invalid password"
    And press "Sign in"
    Then I should see "Invalid email or password."

  Scenario: User has not confirmed email address
    Given a not confirmed user exists with email: "me@example.com", password: "123456"
    When I go to the sign in page
    And fill in "Email" with "me@example.com"
    And fill in "Password" with "123456"
    And press "Sign in"
    Then I should see "You have to confirm your account before continuing."

  Scenario: User forgets his password
    Given a confirmed user exists with email: "me@example.com", password: "123456", full_name: "John Smith"
    And I go to the send password instructions page
    When I fill in "Email" with "me@example.com"
    And I press "Send me reset password instructions"
    Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."
    When I open the email
    Then I should see "Reset password instructions" in the email subject
    And I should see "John Smith" in the email body
