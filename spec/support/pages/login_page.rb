class LoginPage < SitePrism::Page
  set_url 'users/sign_in'

  section :top_bar, TopBar, '.top-bar'

  element :confirm_account_alert,
    '.alert',
    text: 'You have to confirm your account before continuing.'

  def sign_in(email, password)
    top_bar.sign_in_link.click

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    click_button 'Sign in'
  end
end
