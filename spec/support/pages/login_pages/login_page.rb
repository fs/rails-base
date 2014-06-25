class LoginPage
  include Capybara::DSL

  def sign_in(email, password)
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    click_button 'Sign in'
  end

  def go_to_sign_in
    visit new_user_session_path
  end

  def go_to_sign_up
    visit new_user_registration_path
  end

  def go_to_resend_confirmation
    visit user_confirmation_path
  end

  def go_to_forgot_password
    visit new_user_password_path
  end
end
