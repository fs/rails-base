require 'spec_helper'

def sign_in_with(email, password)
  visit new_user_session_path

  fill_in 'user_email', with: email
  fill_in 'user_password', with: password

  click_button 'Sign in'
end

def submit_update_account_form(fields)
  visit edit_user_registration_path

    fields.each do |key, value|
      fill_in("user_#{key}", with: value)
    end

  click_button 'Update'
end

def register
  visit new_user_registration_path

  fill_in 'user_full_name', with: 'Chuck Norris'
  fill_in 'user_email', with: 'chuck.norris@example.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'

  click_button 'Sign up'
end
