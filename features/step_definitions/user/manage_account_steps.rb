def submit_update_account_form(fields)
  visit edit_user_registration_path

  fill_in "Full name", with: fields[:full_name] unless fields[:full_name].blank?
  fill_in "Email", with: fields[:email] unless fields[:email].blank?
  fill_in "Password", with: fields[:password] unless fields[:password].blank?
  fill_in "Password confirmation", with: fields[:password_confirmation] unless fields[:password_confirmation].blank?
  fill_in "Current password", with: fields[:current_password] unless fields[:current_password].blank?

  click_button "Update"
end

When /^I cancel my account$/ do
  visit edit_user_registration_path
  click_link "Cancel my account"
end

When /^I submit update account form with valid data but with wrong current password$/ do
  submit_update_account_form full_name: 'My new name with invalid password',
    email: @current_user.email,
    password: '123456',
    password_confirmation: '123456',
    current_password: 'invalid password'
end

When /^I submit update account form with valid data$/ do
  submit_update_account_form full_name: 'My new name',
    email: @current_user.email,
    password: '123456',
    password_confirmation: '123456',
    current_password: '123456'
end

Then /^my account should not exists$/ do
  User.exists?(@current_user.id).should be_false
end

Then /^my account should be updated successfully$/ do
  @current_user.reload
  @current_user.full_name.should eql 'My new name'
end

Then /^my account should not be updated$/ do
  @current_user.reload
  @current_user.full_name.should_not eql 'My new name with invalid password'
end