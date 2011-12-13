When /^I submit registration form with required fields$/ do
  visit new_user_registration_path

  fill_in "Full name", :with => "Chuck Norris"
  fill_in "Email", :with => "chuck@norris.com"
  fill_in "Password", :with => "123456"
  fill_in "Password confirmation", :with => "123456"
  
  click_button "Sign up"
end

Then /^I should receive registration confirmation email$/ do
  open_email("chuck@norris.com")
  
  current_email.should have_subject /Confirmation instructions/
  current_email.default_part_body.to_s.should =~ /Chuck Norris/
end

Given /^I have email with confirmation link$/ do
  steps %Q{When I submit registration form with required fields}
end

When /^I follow registration confirmation link in the email$/ do
  open_email("chuck@norris.com")
  visit_in_email "Confirm my account"
end

When /^I submit resent confirmtion instruction form$/ do
  Factory.create :not_confirmed_user, :email => "chuck@norris.com", :full_name => "Chuck Norris"
  
  visit new_user_confirmation_path
  
  fill_in "Email", :with => "chuck@norris.com"
  click_button "Resend confirmation instructions"
end

When /^I follow Twitter link for sign up$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
    "provider" => "twitter",
    "id" => 1,
    "info" => { "name" => "John Smith" }
  }  
  
  visit new_user_registration_path
  click_link "Twitter"
end

Then /^I should see form for completing registration over Twitter with prefilled fields$/ do
  find_field("Full name").value.should =~ /John Smith/
end

When /^I submit registration over Twitter form with required fields$/ do
  fill_in "Email", :with => "john@smith.com"
  click_button "Sign up"
end