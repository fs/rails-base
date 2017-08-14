require "rack-mini-profiler"
Rack::MiniProfilerRails.initialize!(Rails.application)

# We prefer MemoryStore
Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore

# Disable MiniProfiler by default, it could be enabled by query string "pp=enable"
Rack::MiniProfiler.config.enabled = Rails.env.development? || Rails.env.staging?

# Configure authorization hook based on IP whitelist
Rack::MiniProfiler.config.authorization_mode = :allow_all
Rack::MiniProfiler.config.pre_authorize_cb = lambda { |env|
  IpWhitelistConstraint.new.matches?(Rack::Request.new(env))
}
