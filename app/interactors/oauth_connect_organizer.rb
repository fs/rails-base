class OauthConnectOrganizer
  attr_reader :auth, :user
  private :auth, :user

  def initialize(auth, user)
    @auth = auth
    @user = user
  end

  def call
    unless user.confirmed?
      auth_verified? ? process_user_confirmation : fail_oauth
    end

    connect_social_profile
  end

  private

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def process_user_confirmation
    user.confirm
    user.send_reset_password_instructions
  end

  def fail_oauth
    fail AuthVerificationPolicy::OauthError,
      "Please confirm your account before connecting your #{auth.provider} account."
  end

  def connect_social_profile
    ConnectSocialProfile.new(user, auth).call
  end
end
