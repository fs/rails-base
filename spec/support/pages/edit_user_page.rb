class EditUserPage < SitePrism::Page
  include Formulaic::Dsl

  set_url '/users/edit'

  section :top_bar, TopBar, '.top-bar'

  element :cancel_account_link, 'a', text: 'Cancel my account'
  element :update_button, 'input[value="Update"]'

  def fill_user_form_with_valid_data(email)
    fill_form(:user, {
      full_name: 'New Name',
      email: email,
      password: '123456',
      password_confirmation: '123456',
      current_password: '123456'
    })

    update_button.click
  end

  def fill_user_form_with_invalid_data(email)
    fill_form(:user, {
      full_name: 'My new name with invalid password',
      email: email,
      password: '123456',
      password_confirmation: '123456',
      current_password: 'invalid password'
    })

    update_button.click
  end
end
