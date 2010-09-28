Factory.sequence :email do |n|
  "somebody#{n}@example.com"
end

Factory.define :user do |u|
  u.full_name 'John Smith'
  u.email { Factory.next(:email) }
  u.password '123456'
end

Factory.define :confirmed_user, :parent => :user do |u|
  u.confirmed_at 1.hour.ago
end

Factory.define :not_confirmed_user, :parent => :user do |u|
  u.confirmed_at nil
end
