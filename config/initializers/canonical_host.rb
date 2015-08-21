# Ensure requests are only served from one, canonical host name
Rails.application.config.middleware.use Rack::CanonicalHost, ENV["CANONICAL_HOST"] if ENV["CANONICAL_HOST"]
