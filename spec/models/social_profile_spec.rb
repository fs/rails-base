require "rails_helper"

describe SocialProfile do
  subject { create(:social_profile, uid: "abc123") }

  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :uid }
  it { is_expected.to validate_presence_of :provider }
  it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }

  describe ".from_omniauth" do
    include_context :auth_hashie

    subject { described_class.from_omniauth(auth_hashie) }

    context "when record exists" do
      let!(:social_profile) { create(:social_profile, uid: auth_hashie.uid, provider: auth_hashie.provider) }

      it { is_expected.to eq(social_profile) }
    end

    context "when record not exists" do
      it { is_expected.to be_nil }
    end
  end
end
