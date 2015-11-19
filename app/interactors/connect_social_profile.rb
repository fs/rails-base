class ConnectSocialProfile
  attr_reader :user, :auth
  private :user, :auth

  def initialize(user, auth)
    @user = user
    @auth = auth
  end

  def call
    if social_profile
      social_profile.update_attribute(:user, user)
    else
      user.apply_omniauth(auth) && user.save
    end
  end

  private

  def social_profile
    @social_profile ||= SocialProfile.from_omniauth(auth)
  end
end
