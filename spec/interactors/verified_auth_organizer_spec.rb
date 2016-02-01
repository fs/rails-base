require "rails_helper"

describe VerifiedAuthOrganizer do
  include_context :auth_hashie

  let(:service) { described_class.new(auth_hashie) }

  subject { service.user }

  context "when social profile exists" do
    let!(:social_profile) { create(:social_profile, uid: auth_hashie.uid, provider: auth_hashie.provider) }

    it { is_expected.to eq(social_profile.user) }
  end

  context "when social profile not exists" do
    context "when user exists" do
      let!(:user) { create(:user, :from_auth_hashie) }

      it "creates related social profile" do
        expect { subject }.to change { user.social_profiles.count }.by(1)
        expect(subject).to eq(user)
      end
    end

    context "when user not exists" do
      it "creates new one" do
        expect { subject }.to change { User.count }.by(1)
      end
    end
  end
end
