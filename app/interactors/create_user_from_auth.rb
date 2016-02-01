class CreateUserFromAuth
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    user = User.new(
      email: auth.info.email,
      full_name: auth.info.name,
      password: new_password,
      password_confirmation: new_password
    )
    user.skip_confirmation_notification! && user.save!
    user
  end

  private

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end
