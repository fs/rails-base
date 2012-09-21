# The shortcut for getting application config
# Application config should be stored in the config/application.rb, config/environments/*.rb
module Kernel
  def app_config
    Rails.application.config
  end
end

# Load .env
Rails.application.config.before_initialize do
  Dotenv.load
end if defined?(Dotenv)
