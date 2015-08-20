require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBaseExample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Application specific options

    # Slim engine default option, initializers/slim.rb
    config.slim_options = {}

    # Default e-mail address which will be shown in the "from" devise emails, initializers/devise.rb,
    config.noreply = "noreply@fs-rails-base.herokuapp.com"

    # Default host for action mailer, initializers/mailer.rb
    config.host = "localhost:5000"

    # We send all feedback email to this address
    config.feedback_email = ENV.fetch("FEEDBACK_EMAIL", "feedback@example.com")
  end
end
