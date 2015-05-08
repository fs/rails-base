FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :title do |n|
    "Title ##{n}"
  end
end
