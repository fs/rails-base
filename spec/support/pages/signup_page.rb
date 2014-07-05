class SignUpPage < SitePrism::Page
  set_url 'users/sign_up'

  def register(fields)
    fill_in 'user_full_name', with: fields[:full_name]
    fill_in 'user_email', with: fields[:email]
    fill_in 'user_password', with: fields[:password]
    fill_in 'user_password_confirmation', with: fields[:password]

    click_button 'Sign up'
  end
end
