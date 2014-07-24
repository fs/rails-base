module Devise
  module Passwords
    class New < SitePrism::Page
      set_url '/users/password/new'

      def password_recovery(email)
        fill_in 'user_email', with: email
        click_button 'Send me reset password instructions'
      end
    end
  end
end
