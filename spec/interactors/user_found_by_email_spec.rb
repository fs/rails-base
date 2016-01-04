require "rails_helper"

describe FindUserByEmailService do
  include_context :auth_hashie

  let(:service) { described_class.new(auth_hashie) }

  subject { service.call }

  context "when user not exists" do
    it { is_expected.to be_nil }
  end

  context "when user exists" do
    let!(:user) { create(:user, :from_auth_hashie) }

    it "creates new social_profile" do
      expect { subject }.to change { user.social_profiles.count }.by(1)
      expect(subject).to eq(user)
    end
  end
end
