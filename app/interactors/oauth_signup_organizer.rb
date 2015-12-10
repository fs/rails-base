class OauthSignupOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call

  end
end
