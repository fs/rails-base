class OauthSignUpOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def user
    if auth_verified?
      VerifiedAuthOrganizer.new(auth).user
    else
      UnverifiedAuthOrganizer.new(auth).user
    end
  end

  private

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end
end
