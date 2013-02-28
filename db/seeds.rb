User.create! do |user|
  user.full_name = 'Example user'
  user.email = 'user@example.com'
  user.password = '123456'
  user.confirmed_at = Time.now
end