Feature: Sign in
  In order to identify myself in the system
  As a registered user
  I want to sign in

  Scenario: User signs in successfully
    Given I am registered user
    When I signs in with valid credentials
    Then I should be signed in

  Scenario: User signs in with invalid credentials
    Given I am registered user
    When I signs in with invalid credentials    
    Then I should be signed out    
  
  Scenario: User has not confirmed email address
    Given I am registered user with not comfirmed email  
    When I signs in with valid credentials
    Then I should see that my email is not confirmed
  
  Scenario: User forgets his password
    Given I am registered user  
    When I request new password
    Then I should receive reset password instructions email
