module Devise
  module Registrations
    class Edit < SitePrism::Page
      include FactoryGirl::Syntax::Methods
      include Formulaic::Dsl

      set_url '/users/edit'

      section :top_bar, TopBar, '.top-bar'

      element :cancel_account_link, 'a', text: 'Cancel my account'
      element :update_button, 'input[value="Update"]'
      element :validation_error, '.error', text: 'is invalid'
      element :alert_box, '.alert-box',
              text: 'Bye! Your account was successfully cancelled. We hope to see you again soon.'

      def cancel_account
        cancel_account_link.click
      end

      def submit_user_form(options)
        fill_form(
          :user,
          attributes_for(:user)
            .slice(*edit_user_attributes)
            .merge(options)
        )

        update_button.click
      end

      def edit_user_attributes
        %i(full_name email password password_confirmation)
      end
    end
  end
end
