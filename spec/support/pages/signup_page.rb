class SignUpPage < SitePrism::Page
  include Formulaic::Dsl

  set_url '/users/sign_up'

  element :sign_up_button, 'input[value="Sign up"]'

  def register(email)
    fill_form(:user, {
      full_name: 'username',
      email: email,
      password: '123456',
      password_confirmation: '123456'
    })

    sign_up_button.click
  end
end
