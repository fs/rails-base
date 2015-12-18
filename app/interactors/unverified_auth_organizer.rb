class UnverifiedAuthOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def user
    if user_found_by_email.present?
      fail AuthVerificationPolicy::OauthError, "Please, connect your account from profile page."
    else
      found_user.send_confirmation_instructions unless found_user.confirmed?
      found_user
    end
  end

  private

  def user_found_by_email
    @user_found_by_email ||= User.find_by(email: auth["info"]["email"])
  end

  def found_user
    user_found_by_uid || new_user
  end

  def user_found_by_uid
    @user_found_by_uid ||= SocialProfile.from_omniauth(auth).try(:user)
  end

  def new_user
    @new_user ||= CreateUserFromAuth.new(auth).call
  end
end
