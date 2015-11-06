ActionMailer::Base.instance_eval do
  default from: ENV.fetch("MAILER_SENDER_ADDRESS")
  default_url_options[:host] = ENV.fetch("HOST")
end
