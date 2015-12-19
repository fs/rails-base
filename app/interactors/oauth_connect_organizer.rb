class OauthConnectOrganizer
  attr_reader :auth, :user
  private :auth, :user

  def initialize(auth, user)
    @auth, @user = auth, user
  end

  def call
    fail_oauth unless auth_verified? && user.confirmed?

    connect_social_profile
    process_user_confirmation unless user.confirmed?
  end

  private

  def fail_oauth
    fail AuthVerificationPolicy::OauthError, "Please confirm your account before connecting your #{auth.provider} account."
  end

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def connect_social_profile
    ConnectSocialProfile.new(user, auth).call
  end

  def process_user_confirmation
    user.reset_password(new_password, new_password)
    user.confirm
    user.send_reset_password_instructions
  end

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end
