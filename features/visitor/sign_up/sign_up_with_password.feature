Feature: Sign up using email and password
  In order to log into the system
  As a user
  I want to register a new account using email and password

  Scenario: User signs up
    When I submit registration form with required fields
    Then I should receive registration confirmation email
    
  Scenario: User follows confirmation link
    Given I have email with confirmation link 
    When I follow registration confirmation link in the email
    Then I should be signed in  
  
  Scenario: User resents email confirmation instructions
    When I submit resent confirmtion instruction form
    Then I should receive registration confirmation email
