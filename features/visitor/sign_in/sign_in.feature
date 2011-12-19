Feature: Sign in
  In order to identify myself in the system
  As a registered user
  I want to sign in

  Scenario: User signs in
    Given I am registered user
    When I signs in with my credentials
    Then I should be signed in

  Scenario: User signs in with invalid credentials
    Given I am registered user
    When I signs in with invalid credentials    
    Then I should be signed out    
  
  Scenario: User has not confirmed email address
    Given I am registered user with not comfirmed email  
    When I signs in with my credentials    
    Then I should see that my email is not confirmed
  
  # Scenario: User forgets his password
  #   Given a confirmed user exists with email: "me@example.com", password: "123456", full_name: "John Smith"
  #   And I go to the send password instructions page
  #   When I fill in "Email" with "me@example.com"
  #   And I press "Send me reset password instructions"
  #   Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."
  #   When I open the email
  #   Then I should see "Reset password instructions" in the email subject
  #   And I should see "John Smith" in the email body
