# Default settings
# For more details see: https://github.com/github/secure_headers#configuration

SecureHeaders::Configuration.default do |config|
  config.csp = {
    default_src: %w('self'),
    script_src: %w('self' 'unsafe-inline'),
    style_src: %w('self')
  }
end
