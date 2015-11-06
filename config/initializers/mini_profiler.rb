mini_profiler_ip_whitelist = ENV.fetch("MINI_PROFILER_IP_WHITELIST",  "").split(",")

Rack::MiniProfiler.config.pre_authorize_cb = lambda { |env|
  request = Rack::Request.new(env)
  mini_profiler_ip_whitelist.include?(request.ip)
}

Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
