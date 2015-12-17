class UnverifiedAuthOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    if user_found_by_email.present?
      fail AuthVerificationPolicy::OauthError, "Alert: Please, connect your account from profile page."
    else
      user.send_confirmation_instructions unless user.confirmed?
      user
    end
  end

  private

  def user_found_by_email
    @user_found_by_email ||= User.find_by(email: auth["info"]["email"])
  end

  def user
    user_found_by_uid || new_user
  end

  def user_found_by_uid
    @user_found_by_uid ||= SocialProfile.from_omniauth(auth).try(:user)
  end

  def new_user
    @new_user ||= UserFromOmniauth.new(auth).call
  end
end
