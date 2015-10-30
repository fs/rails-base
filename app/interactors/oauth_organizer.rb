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
    user.present? ? user.connect_social_profile(auth) : fail_oauth
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
    AuthVerificationPolicy.verified?(auth)
  end

  def build_user
    User.build_from_omniauth(auth) if auth_verified? && !found_user_by_email?
  end

  def found_user_by_email?
    User.find_by(email: auth["info"]["email"]).present?
  end

  def fail_oauth
    fail OauthError, "Sorry, but yours #{auth.provider.titleize} failed verification.
      Seems like yours #{auth.provider.titleize} account hasn't been verified."
  end
end
