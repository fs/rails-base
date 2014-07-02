class ForgotPasswordPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def visit_page
    visit new_user_password_path
    self
  end

  def recover_password(email)
    fill_in 'user_email', with: email
    click_button 'Send me reset password instructions'
  end
end
