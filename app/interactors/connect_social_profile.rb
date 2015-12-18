class ConnectSocialProfile
  attr_reader :user, :auth
  private :user, :auth

  def initialize(user, auth)
    @user, @auth = user, auth
  end

  def call
    if social_profile
      social_profile.update_attribute(:user, user)
    else
      create_social_profile!
    end
  end

  private

  def social_profile
    @social_profile ||= SocialProfile.from_omniauth(auth)
  end

  def create_social_profile!
    user.social_profiles.create!(provider: auth["provider"], uid: auth["uid"])
  end
end
