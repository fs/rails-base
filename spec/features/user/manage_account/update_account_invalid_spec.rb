require 'spec_helper'

def submit_update_account_form(fields)
  visit edit_user_registration_path

  fields.each do |key, value|
    fill_in("user_#{key}", with: value)
  end

  click_button 'Update'
end

step 'I submit update account form with wrong current password' do
  submit_update_account_form(
    full_name: 'My new name with invalid password',
    email: @current_user.email,
    password: '123456',
    password_confirmation: '123456',
    current_password: 'invalid password'
  )
end

step 'my account should not be updated' do
  @current_user.reload
  expect(@current_user.full_name).to_not eql 'My new name with invalid password'
end
