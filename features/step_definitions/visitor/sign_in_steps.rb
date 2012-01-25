def sign_in_with(email, password)
  visit new_user_session_path
  
  fill_in "Email", with: email
  fill_in "Password", with: password
  
  click_button "Sign in"
end

Given /^I exist as a user with not comfirmed email$/ do
  @current_user = Factory.create :not_confirmed_user
end

When /^I sign in with valid credentials$/ do
  sign_in_with @current_user.email, "123456"
end

When /^I sign in with invalid credentials$/ do
  sign_in_with "empty@email.com", "empty password"
end

When /^I sign out$/ do
  within "nav" do
    click_link "Sign out"
  end
end

When /^I request new password$/ do
  visit new_user_password_path
  
  fill_in "Email", with: @current_user.email
  click_button "Send instructions"
end

Then /^I should see that my email is not confirmed$/ do
  page.should have_content "You have to confirm your account before continuing"
end

Then /^I should receive reset password instructions email$/ do
  open_email(@current_user.email)
  
  current_email.should have_subject /Reset password instructions/
  current_email.default_part_body.to_s.should =~ /#{@current_user.full_name}/
end
