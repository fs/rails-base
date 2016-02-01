class ConnectSocialProfile
  attr_reader :user, :auth
  private :user, :auth

  def initialize(user, auth)
    @user = user
    @auth = auth
  end

  def call
    social_profile ? update_social_profile : create_social_profile
  end

  private

  def social_profile
    @social_profile ||= SocialProfile.from_omniauth(auth)
  end

  def update_social_profile
    social_profile.update_attribute(:user, user)
  end

  def create_social_profile
    user.social_profiles.create!(provider: auth.provider, uid: auth.uid)
  end
end
