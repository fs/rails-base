require "rails_helper"

describe FetchOauthUser do
  let(:auth) { omniauth_mock("facebook", "12345", user_attributes) }
  let(:service) { described_class.new(auth) }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email) }

  subject { service.call }

  before do
    allow(AuthVerificationPolicy).to receive(:verified?).and_return(verified)
  end

  context "when user is persisted" do
    let!(:user) { create(:user, user_attributes) }

    context "when auth verified" do
      let(:verified) { true }

      it { is_expected.to eq(user) }
    end

    context "when auth is not verified" do
      let(:verified) { false }

      it { is_expected.not_to eq(user) }
    end
  end

  context "when social_profile persisted" do
    let!(:social_profile) { create(:social_profile, user: user) }

    let(:user) { create(:user, user_attributes) }
    let(:verified) { false }

    it { is_expected.to eq(social_profile.user) }
  end

  context "when user and social profile are not persisted" do
    context "when auth is verified" do
      let(:verified) { true }

      it "returns new user" do
        expect(subject).to be_a_new_record
        expect(subject).to be_kind_of(User)
      end
    end

    context "when auth is not verified" do
      let(:verified) { false }

      it { is_expected.to eq(nil) }
    end
  end
end
