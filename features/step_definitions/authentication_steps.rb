Given /^I am an authenticated user$/ do
  Given %Q{a confirmed user: "me" exists with id: "1", email: "me@example.com", password: 123456, full_name: "Current User"}

  When %Q{I go to the sign in page}
  When %Q{fill in "Email" with "me@example.com"}
  When %Q{fill in "Password" with "123456"}
  When %Q{press "Sign in"}
end

Given /^I am logged out$/ do
  Given %Q{I am on the sign out page}
end

Then /^I should be signed in$/ do
  Then %Q{I should see "Sign out" within "#navigation"}
end

Then /^access should be denied via authentication rule$/ do
  Then %Q{I should be on the sign in page}
  Then %Q{I should see "You need to sign in or sign up before continuing"}
end
