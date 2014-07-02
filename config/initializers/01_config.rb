# The shortcut for getting application config
# Application config should be stored in the config/application.rb, config/environments/*.rb
module Kernel
  def app_config
    Rails.application.config
  end
end
