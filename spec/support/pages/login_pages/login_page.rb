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

  def has_sign_out_link?
    top_bar.has_content? 'Sign out'
  end

  def has_sign_in_link?
    top_bar.has_content? 'Sign in'
  end

  def has_confirm_account_text?
    has_content? 'You have to confirm your account before continuing'
  end

  private

  def top_bar
    find('.top-bar')
  end
end
