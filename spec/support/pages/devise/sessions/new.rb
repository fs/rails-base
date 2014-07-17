module Devise
  module Sessions
    class New < SitePrism::Page
      include Formulaic::Dsl

      set_url '/users/sign_in'

      section :top_bar, TopBar, '.top-bar'

      element :sign_in_button, 'input[value="Sign in"]'
      element :confirm_account_alert,
              '.alert',
              text: 'You have to confirm your account before continuing.'

      def sign_in(email, password)
        top_bar.sign_in_link.click

        fill_form(
          :user,
          email: email,
          password: password
        )

        sign_in_button.click
      end
    end
  end
end
