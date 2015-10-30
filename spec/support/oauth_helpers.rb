module OauthHelpers
  def stub_omniauth(provider, omniauth_mock)
    OmniAuth.config.test_mode                     = true
    OmniAuth.config.mock_auth[provider]           = omniauth_mock
    Rails.application.env_config["omniauth.auth"] = omniauth_mock
  end

  def omniauth_mock(provider, uid, user_attrs = {})
    OmniAuth::AuthHash.new(
      provider: provider.to_s,
      uid: uid,
      info: { name: user_attrs[:full_name], email: user_attrs[:email] }
    )
  end
end
