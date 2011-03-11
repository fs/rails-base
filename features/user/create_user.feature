Feature: Sign up
  In order to log into the system
  As a user
  I want to register a new account with the system

  Scenario: User signs up
    When I go to the sign up page
    And I fill in "Full name" with "Chuck Norris"
    And fill in "Email" with "chuck@example.com"
    And fill in "Password" with "123456"
    And fill in "Password confirmation" with "123456"
    And press "Sign up"
    Then I should be on the sign in page
    When "chuck@example.com" opens the email with subject "Confirmation instructions"
    Then they should see "Chuck Norris" in the email body
    When they follow "Confirm my account" in the email
    Then I should be signed in
    And I should be on the home page

  Scenario: User resents email confirmation instructions
    Given a not confirmed user exists with email: "chuck@example.com", password: "123456"
    And I go to the resend confirmation instructions page
    When I fill in "Email" with "new_user@example.com"
    And press "Resend confirmation instructions"
    Then "chuck@example.com" should receive an email with subject "Confirmation instructions"

  Scenario: User signs up with invalid date
    When I go to the sign up page
    And I fill in "Full name" with ""
    And fill in "Email" with "invalid email"
    And fill in "Password" with "123456"
    And fill in "Password confirmation" with "123456"
    And press "Sign up"
    Then I should see "can't be blank" error for "user_full_name"
    And I should see "invalid" error for "user_email"
