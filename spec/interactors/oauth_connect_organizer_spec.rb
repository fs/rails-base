require "rails_helper"

describe OauthConnectOrganizer do
  include_context :auth_hashie

  let(:service) { described_class.new(auth_hashie, user) }

  subject { service.call }

  context "when user confirmed" do
    let(:user) { create(:user, :confirmed) }

    before do
      allow(ConnectSocialProfile).to receive_message_chain(:new, :call)
      service.call
    end

    it "creates social profile" do
      expect(ConnectSocialProfile).to have_received(:new).with(user, auth_hashie)
    end
  end

  context "when user not confirmed" do
    let(:user) { create(:user) }

    context "when auth not verified" do
      include_context :invalid_auth_hashie

      it "raises error" do
        expect { subject }.to raise_error(AuthVerificationPolicy::OauthError)
      end
    end

    context "when auth verified" do
      before do
        allow(ProcessUserConfirmation).to receive_message_chain(:new, :call)
        service.call
      end

      it "invokes ProcessUserConfirmation" do
        expect(ProcessUserConfirmation).to have_received(:new).with(user)
      end
    end
  end
end
