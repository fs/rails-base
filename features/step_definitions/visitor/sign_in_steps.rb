def sign_in_with(email, password)
  visit new_user_session_path
  
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  
  click_button "Sign in"
end

When /^I signs in with my credentials$/ do
  sign_in_with @current_user.email, "123456"
end

When /^I signs in with invalid credentials$/ do
  sign_in_with "empty@email.com", "empty password"
end

Given /^I am registered user with not comfirmed email$/ do
  @current_user = Factory.create :not_confirmed_user
end

Then /^I should see that my email is not confirmed$/ do
  page.should have_content "You have to confirm your account before continuing"
end

When /^I signs out$/ do
  within "#navigation" do
    click_link "Sign out"
  end
end

Given /^I am registered user over Twitter$/ do
  @current_user = Factory.create :user_registered_over_twitter
end

When /^I signs in with my Twitter account$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
    "provider" => "twitter",
    "uid" => 1,
    "info" => { "name" => @current_user.full_name }
  }  

  visit new_user_session_path
  click_link "Twitter"
end