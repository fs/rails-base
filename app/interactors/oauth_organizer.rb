class OauthOrganizer
  class OauthError < StandardError
  end

  attr_reader :auth, :current_user
  private :auth, :current_user

  def initialize(current_user, auth)
    @current_user = current_user
    @auth = auth
  end

  def call
    user.present? ? connect_social_profile : fail_oauth
    user
  end

  private

  def user
    @user ||= current_user || fetch_oauth_user || build_user
  end

  def fetch_oauth_user
    FetchOauthUser.new(auth).call if auth_verified?
  end

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def build_user
    User.build_from_omniauth(auth) if auth_verified?
  end

  def connect_social_profile
    ConnectSocialProfile.new(user, auth).call
  end

  def fail_oauth
    fail OauthError, "Sorry, but yours #{auth.provider.titleize} failed verification.
      Seems like yours #{auth.provider.titleize} account hasn't been verified."
  end
end
