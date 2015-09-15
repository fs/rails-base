module MiniProfilerAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize_mini_profiler
  end

  private

  def authorize_mini_profiler
    Rack::MiniProfiler.authorize_request if app_config.mini_profiler_ip_whitelist.include?(request.remote_ip)
  end
end
