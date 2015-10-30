class FetchOauthUser
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    find_user_by_email || find_social_profile_user || build_user
  end

  private

  def find_user_by_email
    user_by_email if auth_verified?
  end

  def user_by_email
    @user_by_email ||= User.find_by(email: auth["info"]["email"])
  end

  def auth_verified?
    @auth_verified ||= AuthVerificationPolicy.verified?(auth)
  end

  def find_social_profile_user
    social_profile.try(:user)
  end

  def social_profile
    SocialProfile.from_omniauth(auth)
  end

  def build_user
    User.build_from_omniauth(auth) if auth_verified? && user_by_email.nil?
  end
end
