class LoginPage
  include Capybara::DSL

  def visit_page
    visit 'users/sign_in'
    self
  end

  def sign_in(email, password)
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    click_button 'Sign in'
  end
end
