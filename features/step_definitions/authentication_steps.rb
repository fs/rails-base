Given /^I am registered user$/ do
  @current_user = Factory.create :confirmed_user
end

Given /^I am an authenticated user$/ do
  @current_user = Factory.create :confirmed_user
  sign_in_with @current_user.email, "123456"
end

Given /^I am an authenticated user over Twitter$/ do
  steps %Q{
    Given I am registered user over Twitter
    When I signs in with my Twitter account
  }
end

Then /^I should be signed in$/ do
  within "#navigation" do
    page.should have_content "Sign out"
  end
end

Then /^I should be signed out$/ do
  within "#navigation" do
    page.should_not have_content "Sign out"
  end
end


