require "rails_helper"

describe ConnectSocialProfile do
  let(:user) { create(:user) }
  let(:provider) { "facebook" }
  let(:uid) { "12345" }
  let(:auth) { omniauth_mock(provider, uid) }
  let(:service) { described_class.new(user, auth) }

  subject { service.call }

  context "when social_profile not exists" do
    it "creates related social_profile" do
      expect { subject }.to change { user.social_profiles.count }.by(1)
    end
  end

  context "when disconnected social profile exists" do
    let!(:social_profile) { create(:social_profile, provider: provider, uid: uid, user: another_user) }

    let(:another_user) { create(:user) }

    it "changes user for given social_profile" do
      expect { subject }.to change { social_profile.reload.user }.from(another_user).to(user)
    end
  end
end
