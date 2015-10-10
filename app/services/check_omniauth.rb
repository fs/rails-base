class CheckOmniauth
  def self.verified?(auth)
    case auth.provider
    when "facebook"
      auth.info.verified?
    when "google_oauth2"
      auth.extra.raw_info.email_verified?
    end
  end
end
