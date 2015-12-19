class OauthConnectOrganizer
  attr_reader :auth, :user
  private :auth, :user

  def initialize(auth, user)
    @auth, @user = auth, user
  end

  def call
    unless user.confirmed?
      auth_verified? ? process_user_confirmation : fail_oauth
    end

    connect_social_profile
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
    ProcessUserConfirmation.new(user).call
  end
end
