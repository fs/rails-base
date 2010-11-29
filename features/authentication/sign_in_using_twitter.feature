Feature: Sign in using twitter
  I order to identify myself in the system with my Twitter account
  As a registered user
  I want to sign in

  @vcr
  Scenario: User signs in using Twitter account
    Given I exist in the application as registered user
    And I have identity for Twitter authorization
    When I go to the sign in page
    And I follow "Sign in with Twitter"
    When I fill in "session[username_or_email]" with "timurv"
    And I fill in "session[password]" with "BxxUxnk48bpJeeVB8xwBPe1$QMmA"
    And I press "Sign in"
    Then I should be signed in
    And I should be on the home page
    And I should see "Signed in successfully."
