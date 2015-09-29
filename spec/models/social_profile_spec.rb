require "rails_helper"

describe SocialProfile do
  subject { create :social_profile }

  it { should belong_to :user }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :uid }
  it { is_expected.to validate_presence_of :provider }
  it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
end
