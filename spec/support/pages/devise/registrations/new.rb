module Devise
  module Registrations
    class New < SitePrism::Page
      include FactoryGirl::Syntax::Methods
      include Formulaic::Dsl

      set_url '/users/sign_up'

      element :sign_up_button, 'input[value="Sign up"]'

      def register
        fill_form(
          :user,
          attributes_for(:user).slice(*signup_attributes)
        )

        sign_up_button.click
      end

      private

      def signup_attributes
        %i(full_name email password password_confirmation)
      end
    end
  end
end
