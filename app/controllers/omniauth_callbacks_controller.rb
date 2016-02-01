class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  SocialProfile::PROVIDERS.each do |provider|
    define_method(provider.to_s) do
      begin
        current_user ? connect_social_profile : handle_sign_in
      rescue AuthVerificationPolicy::OauthError => e
        redirect_to root_path, flash: { notice: e.to_s }
      end
    end
  end

  private

  def connect_social_profile
    OauthConnectOrganizer.new(auth, current_user).call
    redirect_to edit_user_registration_path
  end

  def auth
    request.env["omniauth.auth"]
  end

  def handle_sign_in
    user = auth_organizer.new(auth).user
    sign_in_and_redirect user, event: :authentication
  end

  def auth_organizer
    auth_verified? ? VerifiedAuthOrganizer : UnverifiedAuthOrganizer
  end

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def after_sign_in_path_for(resource)
    if resource.confirmed?
      edit_user_registration_path
    else
      session[:auth_verified?] = auth_verified?
      resource.reset_password(new_password, new_password)
      finish_signup_path(resource)
    end
  end

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end
