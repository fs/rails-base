Factory.sequence :email do |n|
  "somebody#{n}@example.com"
end

Factory.define :user do |u|
  u.full_name 'User name'
  u.email { Factory.next(:email) }
  u.password '123456'
end
