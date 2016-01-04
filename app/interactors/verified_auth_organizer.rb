class VerifiedAuthOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def user
    user_found_by_uid || user_found_by_email || new_user
  end

  private

  def user_found_by_uid
    SocialProfile.from_omniauth(auth).try(:user)
  end

  def user_found_by_email
    FindUserByEmailService.new(auth).call
  end

  def new_user
    CreateUserFromAuth.new(auth).call
  end
end
