class UserFoundByUid
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    SocialProfile.from_omniauth(auth).try(:user)
  end
end

# user.reset_password(new_password, new_password)
# user.confirm!
# fail "Need to finish sign-up!"
# TODO: handle password_reset, confirmation and redirection in controller