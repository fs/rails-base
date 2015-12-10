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
    fail unless current_user # temporarily handling only connecting account from profile page

    OauthConnectOrganizer.new(auth, current_user).call
    redirect_to edit_user_registration_path
  end

  def handle_error(message)
    redirect_to root_url, error: message
  end

  def auth
    request.env["omniauth.auth"]
  end
end
