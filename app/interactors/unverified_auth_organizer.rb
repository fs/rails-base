class UnverifiedAuthOrganizer
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def user
    if user_found_by_uid.present?
      user_found_by_uid.send_confirmation_instructions unless user_found_by_uid.confirmed?
    elsif user_found_by_email.present?
      fail "Alert: Please, connect your account from profile page"
    else
      user_from_omniauth.send_confirmation_instructions
    end
  end

  private

  def user_found_by_uid
    @user_found_by_uid ||= SocialProfile.from_omniauth(auth).try(:user)
  end

  def user_found_by_email
    @user_found_by_email ||= User.find_by(email: auth["info"]["email"])
  end

  def user_from_omniauth
    @user_from_omniauth ||= UserFromOmniauth.new(auth).call
  end
end
