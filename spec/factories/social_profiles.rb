FactoryGirl.define do
  factory :social_profile do
    user
    provider "facebook"
    uid "12345"
  end
end
