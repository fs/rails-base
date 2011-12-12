Given /^I am an authenticated user$/ do
  steps %Q{
    Given a confirmed user: "me" exists with id: "1", email: "me@example.com", password: 123456, full_name: "Current User"
    When I go to the sign in page
    When fill in "Email" with "me@example.com"
    When fill in "Password" with "123456"
    When press "Sign in"
  }
end

Given /^I am logged out$/ do
  steps %Q{
    Given I am on the sign out page
  }
end

Then /^I should be signed in$/ do
  steps %Q{
    Then I should see "Sign out" within "#navigation"
  }
end

Then /^access should be denied via authentication rule$/ do
  steps %Q{
    Then I should be on the sign in page
    Then I should see "You need to sign in or sign up before continuing"
  }
end
