class ForgotPasswordPage
  include Capybara::DSL

  def recover_password(email)
    fill_in 'user_email', with: email
    click_button 'Send me reset password instructions'
  end
end
