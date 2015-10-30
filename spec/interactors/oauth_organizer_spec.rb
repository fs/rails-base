require "rails_helper"

describe OauthOrganizer do
  let(:oauth) { omniauth_mock("facebook", "12345") }
  let(:service) { described_class.new(current_user, oauth) }

  subject { service.call }

  context "when user present" do
    let(:current_user) { create(:user) }

    it "connects new social_profile" do
      expect { subject }.to change { current_user.social_profiles.count }.by(1)
      expect(subject).to eq(current_user)
    end
  end

  context "when user not present" do
    before do
      allow(FetchOauthUser).to receive_message_chain(:new, :call)
      allow(AuthVerificationPolicy).to receive(:verified?)
    end

    let(:current_user) { nil }

    it "fails OauthError" do
      expect { subject }.to raise_error(OauthOrganizer::OauthError)
    end
  end
end
