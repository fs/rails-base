Feature: Sign up using email and password
  In order to log into the system
  As a user
  I want to register a new account using email and password

  Scenario: User signs up successfully
    When I submit registration form with required fields
    Then I should receive registration confirmation email
    
  Scenario: User confirms account
    Given I have email with confirmation link 
    When I follow registration confirmation link in the email
    Then my account should be confirmed
    And I should be signed in
  
  Scenario: User resents email confirmation instructions
    When I submit resent confirmation instruction form
    Then I should receive registration confirmation email
