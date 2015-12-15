class UserFromOmniauth
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    user = User.new
    user.email = auth["info"]["email"]
    user.full_name = auth["info"]["name"]
    user.reset_password(new_password, new_password)
    user
    # user.confirm
    # fail "Need to finish signup"
  end

  private

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end