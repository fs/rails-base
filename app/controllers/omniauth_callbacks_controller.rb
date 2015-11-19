class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include OmniauthHelper

  expose(:user) { OauthOrganizer.new(current_user, auth_hash).call }

  SocialProfile::PROVIDERS.each do |provider|
    define_method(provider.to_s) do
      begin
        handle_user
      rescue OauthOrganizer::OauthError
        handle_error
      end
    end
  end

  def after_sign_in_path_for(_resource)
    edit_user_registration_path
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  # rubocop:disable Metrics/AbcSize
  def handle_user
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider_name(auth_hash.provider)}") if is_navigational_format?
    else
      session[:omniauth] = auth_hash.except("extra")
      redirect_to new_user_registration_url
    end
  end
  # rubocop:enable Metrics/AbcSize

  def handle_error
    redirect_to new_user_session_path,
      notice: t("omniauth.verification.failure", kind: provider_name(auth_hash.provider))
  end
end
