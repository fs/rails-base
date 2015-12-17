class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  SocialProfile::PROVIDERS.each do |provider|
    define_method(provider.to_s) do
      begin
        current_user ? handle_connection : handle_sign_up
      rescue AuthVerificationPolicy::OauthError => e
        handle_error(e)
      end
    end
  end

  private

  def handle_connection
    OauthConnectOrganizer.new(auth, current_user).call
    redirect_to edit_user_registration_path
  end

  def auth
    request.env["omniauth.auth"]
  end

  def handle_sign_up
    if auth_verified?
      user = VerifiedAuthOrganizer.new(auth).user
      user.reset_password(new_password, new_password) unless user.confirmed?
    else
      user = UnverifiedAuthOrganizer.new(auth).call
    end
    sign_in_and_redirect user, event: :authentication
  end

  def handle_error(message)
    redirect_to root_url, error: message
  end

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def after_sign_in_path_for(resource)
    if resource.confirmed?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
