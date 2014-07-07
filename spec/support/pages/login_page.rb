class LoginPage < SitePrism::Page
  set_url 'users/sign_in'

  section :top_bar, TopBar, '.top-bar'

  element :confirm_account_alert,
    '.alert',
    text: 'You have to confirm your account before continuing.'
end
