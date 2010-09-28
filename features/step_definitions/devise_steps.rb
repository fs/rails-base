Given /^I am logged out$/ do
  visit(destroy_user_session_path)
end

Given /^I am logged in$/ do
  visit(new_user_session_path)

  When %Q{submit my sign in informaion}
end

Given /^I exist in the application as registered user$/ do
  @current_user = Factory.create(:confirmed_user)
end

Given /^I exist in the application as registered user with not confirmed email$/ do
  @current_user = Factory.create(:not_confirmed_user)
end

When /^submit my sign in informaion$/ do
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => @current_user.password
  click_button 'user_submit'
end

When /^submit invalid sign in informaion$/ do
  fill_in 'user_email', :with => 'invalid email'
  fill_in 'user_password', :with => 'invalid password'
  click_button 'user_submit'
end

When /^I submit my registration information$/ do
  @current_user = Factory.build(:user)

  fill_in 'user_full_name', :with => @current_user.full_name
  fill_in 'user_email', :with => @current_user.email
  fill_in 'user_password', :with => @current_user.password
  fill_in 'user_password_confirmation', :with => @current_user.password
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

Then /^I should be signed in$/ do
  page.should have_content('My Account')
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
