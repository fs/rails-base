Factory.define :user do |u|
  u.full_name 'John Smith'
  u.email { Factory.next(:email) }
  u.password '123456'
end

Factory.define :confirmed_user, :parent => :user do |u|
  u.confirmed_at 1.hour.ago
end

Factory.define :user_registered_over_twitter, :parent => :user do |u|
  u.password ''
  u.confirmed_at 1.hour.ago
  u.identities {|a| [ a.association :twitter_identity ]}
end

Factory.define :not_confirmed_user, :parent => :user do |u|
  u.confirmed_at nil
end
