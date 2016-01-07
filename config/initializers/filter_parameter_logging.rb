# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]

# Filter out from log files some sensitive locations your application is redirecting to.
Rails.application.config.filter_redirect << "s3.amazonaws.com"
