require "rails_helper"

describe UnverifiedAuthOrganizer do
  include_context :auth_hashie

  let(:service) { described_class.new(auth_hashie) }

  subject { service.user }

  context "when user found by email" do
    before { create(:user, :from_auth_hashie) }

    it "raises error" do
      expect { subject }.to raise_error(AuthVerificationPolicy::OauthError)
    end
  end

  context "when user found by uid" do
    let!(:social_profile) { create(:social_profile, provider: auth_hashie.provider, uid: auth_hashie.uid, user: user) }

    let(:emails) { ActionMailer::Base.deliveries }

    context "when user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      it "not sends confirmation notification" do
        expect(emails).to be_empty
      end
    end

    context "when user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }
      let(:email) { emails.last }

      it "sends confirmation notification" do
        expect(email.subject).to eq("Confirmation instructions")
        expect(email.to).to eq([user.email])
      end
    end
  end

  context "when user not found" do
    let(:user) { User.last }

    it "creates new user from auth_hashie" do
      expect { subject }.to change { User.count }.by(1)
      expect(subject).to eq(user)
    end
  end
end
