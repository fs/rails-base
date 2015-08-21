# Require authentication if password is set
if ENV["AUTH_BASIC_PASS"]
  realm = ENV.fetch("AUTH_BASIC_REALM", Rails.application.class.to_s.deconstantize.titleize)
  Rails.application.config.middleware.use Rack::Auth::Basic, realm do |_, password|
    ENV["AUTH_BASIC_PASS"] == password
  end
end
