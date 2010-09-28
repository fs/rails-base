Feature: Sign up
  As a newcomer to the application
  I want to sign up

  Scenario: User signs up
    When I go to the new user registration page
    And I fill in "user_full_name" with "Timur Vafin"
    And I fill in "user_email" with "me@timurv.ru"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "You have signed up successfully."

  Scenario: User signs up with invalid date
    When I go to the new user registration page
    And I fill in "user_email" with "me@timurv.ru"
    And I fill in "user_password" with "123456"
    And I press "Sign up"
    Then I should see "can't be blank" error for "user_full_name"
    And I should see "doesn't match confirmation" error for "user_password"
