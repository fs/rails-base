@webmock
Feature: Sign in using twitter
  I order to identify myself in the system with my Twitter account
  As a registered user
  I want to sign in

  Scenario: User signs in using linked Twitter account
    Given I am registered user over Twitter
    When I sign in with my Twitter account
    Then I should be signed in