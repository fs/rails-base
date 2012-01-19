Given /^I exist as a user$/ do
  @current_user = Factory.create :confirmed_user
end

Given /^I am signed in$/ do
  @current_user = Factory.create :confirmed_user
  sign_in_with @current_user.email, "123456"
end

Then /^I should be signed in$/ do
  within "nav" do
    page.should have_content "Sign out"
  end
end

Then /^I should be signed out$/ do
  within "nav" do
    page.should_not have_content "Sign out"
  end
end


