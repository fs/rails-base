FactoryGirl.define do
  factory :feedback do
    email
    name { Faker::Name.name }
    message { Faker::Lorem.paragraph }
    phone { Faker::PhoneNumber.phone_number }
  end
end
