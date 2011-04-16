Feature: Update account information without current password
  In order to keep my info up-to-date
  As a registered user with out password b/c I was registered with my Twitter account
  I want to be able to update my account information

  Background:
    Given a user registered over twitter exists with email: "me@example.com"
    And I am logged in with Twitter account
    And I am on the edit account page

  Scenario: User updates successfully full name without current password
    When I fill in "Full name" with "Super Man"
    And I press "Update"
    Then I should see "You updated your account successfully."
    And I should be on the home page

  Scenario: User sets password for account and then updates full name without current password
    When I fill in "Password" with "654321"
    And fill in "Password confirmation" with "654321"
    And press "Update"
    Then I should see "You updated your account successfully."
    And I should be on the home page
    When I go to the edit account page
    And fill in "Current password" with "wrong password"
    And press "Update"
    Then I should see "is invalid" error for "user_current_password"
