ActionMailer::Base.instance_eval do
  default from: app_config.noreply
  default_url_options[:host] = app_config.host
end
