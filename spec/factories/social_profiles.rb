FactoryGirl.define do
  factory :social_profile do
    user
    provider "facebook"
    uid "123545"
  end
end
