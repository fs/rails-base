module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    expose(:user) { OauthOrganizer.new(auth, current_user).call }
    expose(:social_profile) { SocialProfile.from_omniauth(auth) }

    SocialProfile::PROVIDERS.each do |provider|
      define_method "#{provider}" do
        begin
          handle_user(user_from_oauth, provider)
        rescue OauthOrganizer::OauthError => e
          handle_error(e, provider)
        end
      end
    end

    private

    def handle_user(user, provider)
      if user.persisted?
        sign_in_and_redirect user, event: :authentication
        set_flash_message(:notice, :success, kind: "#{provider.titleize}") if is_navigational_format?
      else
        session["devise.#{provider}_data"] = auth
        redirect_to new_user_registration_url
      end
    end

    def handle_error(e, provider)
      if user_signed_in?
        redirect_to root_path, notice: e.message
      else
        redirect_to new_user_session_path,
                    notice: "Your #{provider.titleize} account can't be used to sign in. Please verify it via profile page."
      end
    end

    def auth
      request.env["omniauth.auth"]
    end

    def auth_verified?
      OmniauthVerificationPolicy.new(auth).verified?
    end
  end
end
