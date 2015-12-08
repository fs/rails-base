class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  SocialProfile::PROVIDERS.each do |provider|
    define_method(provider.to_s) do
      begin
        handle_user
      rescue OauthOrganizer::OauthError
        handle_error
      end
    end
  end

  private

  def handle_user
    fail unless current_user # temporarily handling only connecting account from profile page

    begin
      ConnectAccountOrganizer.new(auth, current_user).call
    rescue ConnectAccountOrganizer::OauthError => e
      redirect_to root_url, error: e
    end

    redirect_to edit_user_registration_path
  end

  def auth
    request.env["omniauth.auth"]
  end
end
