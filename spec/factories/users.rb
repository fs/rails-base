FactoryGirl.define do
  factory :user do
    full_name 'John Smith'
    email
    password '123456'
    
    factory :confirmed_user do
      confirmed_at 1.hour.ago
    end

    factory :not_confirmed_user do
      confirmed_at nil
    end    
  end
end
