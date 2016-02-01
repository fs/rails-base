require "rails_helper"

describe ConnectSocialProfile do
  include_context :auth_hashie

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:service) { described_class.new(user_2, auth_hashie) }

  subject { service.call }

  context "when social_profile exists" do
    let!(:social_profile) do
      create(:social_profile, uid: auth_hashie.uid, provider: auth_hashie.provider, user: user_1)
    end

    it "updates user record" do
      expect { subject }.to change { social_profile.reload.user }.from(user_1).to(user_2)
    end
  end

  context "when social profile not exists" do
    it "creates related social profile" do
      expect { subject }.to change { user_2.social_profiles.count }.by(1)
    end
  end
end
