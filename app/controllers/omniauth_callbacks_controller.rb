class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  SocialProfile::PROVIDERS.each do |provider|
    define_method(provider.to_s) do
      begin
        handle_user
      rescue OauthConnectOrganizer::OauthError => e
        handle_error(e)
      end
    end
  end

  private

  def handle_user
    if current_user
      OauthConnectOrganizer.new(auth, current_user).call
      redirect_to edit_user_registration_path
    else
      user = OauthSignUpOrganizer.new(auth).user

      unless user.confirmed?
        user.reset_password(new_password, new_password)
        user.confirm!
        # fail "Need to finish sign-up!"
        redirect_to finish_signup_path
      end

    end
  end

  def handle_error(message)
    redirect_to root_url, error: message
  end

  def auth
    request.env["omniauth.auth"]
  end
end
