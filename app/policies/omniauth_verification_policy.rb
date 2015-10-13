class OmniauthVerificationPolicy
  attr_reader :auth

  def initialize(auth)
    @auth = auth
  end

  def verified?
    case auth.provider
    when "facebook"
      auth.info.verified?
    when "google_oauth2"
      auth.extra.raw_info.email_verified?
    else
      fail ArgumentError, "Verification checking is not implemented for provider: '#{auth.provider}'"
    end
  end
end
