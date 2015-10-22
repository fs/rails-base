class OauthOrganizer
  class OauthError < StandardError
  end

  def initialize(auth, current_user)
    @auth = auth
    @current_user = current_user
  end

  def call
    user = build_response
    user.present? ? connect_accounts!(user) : fail_oauth

    user
  end

  private

  def build_response
    response = find_user_by_identity || find_user_by_email || sign_up_with_oauth

    response
  end

  def find_user_by_identity
    ExistingUserIdentityAuthenticationService.new(@auth, @current_user).call if auth_verified?
  end

  def find_user_by_email
    ExistingUserEmailAuthenticationService.new(@auth).call if auth_verified?
  end

  def found_user_by_email?
    ExistingUserEmailAuthenticationService.new(@auth).call.present?
  end

  def sign_up_with_oauth
    NewUserRegistrationService.new(@auth).call if !found_user_by_email? && auth_verified?
  end

  def fail_oauth
    fail OauthError,
         "Sorry, but yours #{@auth.provider.titleize} failed verification.
      Seems like yours #{@auth.provider.titleize} account hasn't been verified."
  end

  def connect_accounts!(user)
    identity = Identity.find_for_oauth(@auth)
    return false if identity.user == user

    identity.update_attribute(:user, user)
  end

  def auth_verified?
    OmniauthVerificationPolicy.new(@auth).verified?
  end
end
