require "rails_helper"

describe FetchOauthUser do
  let(:auth) { omniauth_mock("facebook", "12345", user_attributes) }
  let(:service) { described_class.new(auth) }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email) }

  subject { service.call }

  context "when user is persisted" do
    let!(:user) { create(:user, user_attributes) }

    it { is_expected.to eq(user) }
  end

  context "when social_profile persisted" do
    let!(:social_profile) { create(:social_profile, user: user) }

    let(:user) { create(:user, user_attributes) }

    it { is_expected.to eq(social_profile.user) }
  end

  context "when user and social profile are not persisted" do
    it { is_expected.to eq(nil) }
  end
end
