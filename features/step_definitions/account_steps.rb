When /^I submit my user information$/ do
  fill_in 'user_full_name', :with => @current_user.full_name
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => '123456'
  fill_in 'user_password_confirmation', :with => '123456'
  fill_in 'user_current_password', :with => @current_user.password

  click_button 'user_submit'
end

When /^I submit my user information with invalid current password$/ do
  fill_in 'user_current_password', :with => 'invalid current password'
  click_button 'user_submit'
end

Then /^my account should not be found$/ do
  User.exists?(:email => @current_user.email).should be_false
end