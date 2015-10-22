class ExistingUserIdentityAuthenticationService
  def initialize(auth, signed_in_resource = nil)
    @auth = auth
    @signed_in_resource = signed_in_resource
    @identity = SocialProfile.find_by(uid: @auth.uid, provider: @auth.provider)
  end

  def call
    user = @signed_in_resource || @identity.try(:user)

    user
  end
end
