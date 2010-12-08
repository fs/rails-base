Given /^I exist in the application as registered user$/ do
  @current_user = Factory.create(:confirmed_user)
end

Given /^I exist in the application as registered over Twitter user$/ do
  @current_user = Factory.create(:user_registered_over_twitter)
end

Given /^I exist in the application as registered user with not confirmed email$/ do
  @current_user = Factory.create(:not_confirmed_user)
end

When /^I submit my registration information$/ do
  @current_user = Factory.build(:user)

  fill_in 'user_full_name', :with => @current_user.full_name
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => @current_user.password
  fill_in 'user_password_confirmation', :with => @current_user.password
  click_button 'user_submit'
end

When /^I submit my registration information for sign up using Twitter$/ do
  @current_user = Factory.build(:user)
  fill_in 'user_email', :with => @current_user.email
  click_button 'user_submit'
end

When /^I submit invalid registration information$/ do
  @current_user = Factory.build(:user)

  fill_in 'user_full_name', :with => @current_user.full_name
  click_button 'user_submit'
end

When /^I click on the confirmation link in the confirmation email$/ do
  click_email_link_matching /confirm/i
end

When /^I submit send password instructions form$/ do
  fill_in 'user_email', :with => @current_user.email
  click_button 'user_submit'
end

When /^I submit resend confirmation form$/ do
  fill_in 'user_email', :with => @current_user.email
  click_button 'user_submit'
end

When /^I submit my user information$/ do
  fill_in 'user_full_name', :with => @current_user.full_name
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => '123456'
  fill_in 'user_password_confirmation', :with => '123456'
  fill_in 'user_current_password', :with => @current_user.password

  click_button 'user_submit'
end

When /^I submit my user information without current password$/ do
  fill_in 'user_full_name', :with => @current_user.full_name
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => '123456'
  fill_in 'user_password_confirmation', :with => '123456'

  click_button 'user_submit'
end

When /^I submit my user information with invalid current password$/ do
  fill_in 'user_current_password', :with => 'invalid current password'
  click_button 'user_submit'
end

Then /^(?:I|they) should receive an email with a link to a confirmation page$/ do
  open_last_email_for(last_email_address)
  current_email.should have_subject(/confirmation/i)
  current_email.should have_body_text(@current_user.full_name)
end

Then /^I should see errors for the registration information$/ do
  Then %Q{I should see "can't be blank" error for "user_email"}
end

Then /^I should receive an email with a link to a password instructions page$/ do
  open_last_email_for(last_email_address)
  current_email.should have_subject(/password/i)
  current_email.should have_body_text(@current_user.full_name)
end

Then /^my account should not be found$/ do
  User.exists?(:email => @current_user.email).should be_false
end