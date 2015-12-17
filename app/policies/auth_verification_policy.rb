class AuthVerificationPolicy
  class OauthError < StandardError
  end

  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def verified?
    request_verification_for
  rescue NoMethodError
    fail_with_error
  end

  private

  def request_verification_for
    send(auth.provider)
  end

  def fail_with_error
    fail ArgumentError, I18n.t("omniauth.verification.not_implemented", kind: auth.provider)
  end

  def facebook
    auth.info.verified? || auth.extra.raw_info.verified?
  end

  def google_oauth2
    auth.extra.raw_info.email_verified?
  end
end
