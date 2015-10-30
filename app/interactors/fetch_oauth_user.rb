class FetchOauthUser
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    find_user_by_email || find_social_profile_user
  end

  private

  def find_user_by_email
    User.find_by(email: auth["info"]["email"])
  end

  def find_social_profile_user
    SocialProfile.from_omniauth(auth).try(:user)
  end
end
