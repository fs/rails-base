class UserFoundByEmail
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    return unless user
    create_social_profile
    user
  end

  private

  def user
    @user ||= User.find_by(email: auth["info"]["email"])
  end

  def create_social_profile
    user.social_profiles.create!(provider: auth["provider"], uid: auth["uid"])
  end
end
