class TopBar < SitePrism::Section
  element :sign_in_link, 'a', text: 'Sign in'
  element :sign_out_link, 'a', text: 'Sign out'

  def sign_in(email, password)
    sign_in_link.click

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    click_button 'Sign in'
  end
end
