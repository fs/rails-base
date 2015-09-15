app_config.mini_profiler_ip_whitelist = ENV.fetch("MINI_PROFILER_IP_WHITELIST",  "").split(",")
Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
