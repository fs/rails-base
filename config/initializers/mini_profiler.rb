require "rack-mini-profiler"

Rack::MiniProfilerRails.initialize!(Rails.application)

# Make sure Deflater middleware works after MiniProfiler
# https://github.com/MiniProfiler/rack-mini-profiler#custom-middleware-ordering-required-if-using-rackdeflate-with-rails
Rails.application.middleware.delete(Rack::MiniProfiler)
Rails.application.middleware.insert_after(Rack::Deflater, Rack::MiniProfiler)

# We prefer MemoryStore
Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore

# Disable MiniProfiler by default, it could be enabled by query string "pp=enable"
Rack::MiniProfiler.config.enabled = false

# Configure authorization hook based on IP whitelist
ip_whitelist = ENV.fetch("MINI_PROFILER_IP_WHITELIST",  "").split(",")
Rack::MiniProfiler.config.authorization_mode = :allow_all
Rack::MiniProfiler.config.pre_authorize_cb = lambda { |env|
  request = Rack::Request.new(env)
  ip_whitelist.include?(request.ip)
}
