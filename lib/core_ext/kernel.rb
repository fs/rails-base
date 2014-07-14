module Kernel
  def app_secrets
    Rails.application.secrets
  end

  # The shortcut for getting application config
  # Application config should be stored in the config/application.rb,
  # config/environments/*.rb
  #
  def app_config
    Rails.application.config
  end
end
