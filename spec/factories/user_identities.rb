FactoryGirl.define do
  factory :twitter_identity, :class => UserIdentity do
    provider 'twitter'
    uid '1'
  end
end
