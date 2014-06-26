class ForgotPasswordPage
  include Capybara::DSL

  def visit_page
    visit('users/password/new')
    self
  end

  def recover_password(email)
    click_link 'Forgot your password?'

    fill_in 'user_email', with: email
    click_button 'Send me reset password instructions'
  end
end
