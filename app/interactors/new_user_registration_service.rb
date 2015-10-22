class NewUserRegistrationService
  TEMP_EMAIL_PREFIX = "change@me"

  def initialize(auth)
    @auth = auth
  end

  def call
    user = create_user_from_auth!

    user
  end

  private

  def create_user_from_auth!
    user = User.new(user_params)
    user.skip_confirmation_notification!
    user.save!

    user
  end

  def user_params
    {
      full_name: @auth.extra.raw_info.name,
      email: @auth.extra.raw_info.email.presence || temp_email,
      password: Devise.friendly_token[0, 20]
    }
  end

  def temp_email
    "#{TEMP_EMAIL_PREFIX}-#{@auth.uid}-#{@auth.provider}.com"
  end
end
