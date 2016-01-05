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
        allow(user).to receive(:confirm)
        allow(user).to receive(:send_reset_password_instructions)
        service.call
      end

      it "confirms user" do
        expect(user).to have_received(:confirm)
        expect(user).to have_received(:send_reset_password_instructions)
      end
    end
  end
end
