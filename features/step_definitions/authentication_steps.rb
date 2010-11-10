Given /^I am an authenticated user$/ do
  Given %Q{I exist in the application as registered user}
  Given %Q{I am logged in}
end

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

Then /^I should be signed in$/ do
  page.should have_content(@current_user.full_name_with_email)
end

