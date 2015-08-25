module MiniProfilerAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize_mini_profiler
  end

  private

  def authorize_mini_profiler
    Rack::MiniProfiler.authorize_request if mini_profiler_authorized?
  end

  def mini_profiler_authorized?
    ENV.fetch("MINI_PROFILER_IP_WHITELIST",  "").split(",").include?(request.remote_ip)
  end
end
