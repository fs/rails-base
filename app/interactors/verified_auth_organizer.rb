class VerifiedAuthOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def user
    user_found_by_uid || user_found_by_email || user_from_omniauth
  end

  private

  def user_found_by_uid
    @user_found_by_uid ||= SocialProfile.from_omniauth(auth).try(:user)
  end

  def user_found_by_email
    @user_found_by_email ||= UserFoundByEmail.new(auth).call
  end

  def user_from_omniauth
    @user_from_omniauth ||= UserFromOmniauth.new(auth).call
  end
end
