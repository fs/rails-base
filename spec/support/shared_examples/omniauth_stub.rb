require "rails_helper"

shared_context :auth_hashie do
  let(:auth_hashie) do
    OmniAuth::AuthHash.new(
      provider: "facebook",
      uid: "123545",
      info: {
        email: "joe@bloggs.com",
        name: "Joe Bloggs",
        verified: true
      },
      extra: {
        raw_info: {
          email: "joe@bloggs.com",
          name: "Joe Bloggs",
          verified: true,
          email_verified: true
        }
      }
    )
  end
end

shared_context :invalid_auth_hashie do
  let(:auth_hashie) do
    OmniAuth::AuthHash.new(
      provider: "facebook",
      uid: "123545",
      info: {
        email: "joe@bloggs.com",
        name: "Joe Bloggs",
        verified: false
      },
      extra: {
        raw_info: {
          email: "joe@bloggs.com",
          name: "Joe Bloggs",
          verified: false,
          email_verified: false
        }
      }
    )
  end
end

shared_context :stub_omniauth do
  background do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: "facebook",
      uid: "123545",
      info: {
        email: "joe@bloggs.com",
        name: "Joe Bloggs",
        verified: true
      },
      extra: {
        raw_info: {
          email: "joe@bloggs.com",
          name: "Joe Bloggs",
          verified: true,
          email_verified: true
        }
      }
    )
  end
end

shared_context :stub_not_verified_omniauth do
  background do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: "facebook",
      uid: "123545",
      info: {
        email: "joe@bloggs.com",
        name: "Joe Bloggs",
        verified: false
      },
      extra: {
        raw_info: {
          email: "joe@bloggs.com",
          name: "Joe Bloggs",
          verified: false,
          email_verified: false
        }
      }
    )
  end
end
