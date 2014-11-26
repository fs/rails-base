# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    text "MyText"
    picture "MyString"
    privacy false
  end
end
