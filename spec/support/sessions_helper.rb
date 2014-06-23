module SessionsHelper
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

  def register(fields)
    visit new_user_registration_path

    fill_in 'user_full_name', with: fields[:full_name]
    fill_in 'user_email', with: fields[:email]
    fill_in 'user_password', with: fields[:password]
    fill_in 'user_password_confirmation', with: fields[:password]

    click_button 'Sign up'
  end
end

RSpec.configure do |config|
  config.include SessionsHelper, type: :feature
end
