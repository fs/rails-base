@webmock
Feature: Sign in using twitter
  I order to identify myself in the system with my Twitter account
  As a registered user
  I want to sign in

  Scenario: User signs in using linked Twitter account
    Given I exist in the application as registered over Twitter user
    And the Twitter OAuth request is successful
    When I go to the sign in page
    And I follow "Sign in with Twitter"
    And Twitter authorizes me as registered user
    Then I should be signed in
    And I should be on the home page
    And I should see "Successfully authorized from twitter account"
