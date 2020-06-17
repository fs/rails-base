require_relative "boot"

require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBase
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults "6.0"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    # config.i18n.default_locale = :de

    # Enable deflate / gzip compression of controller-generated responses
    config.middleware.use Rack::Deflater

    # Set default From address for all Mailers
    config.action_mailer.default_options = { from: ENV.fetch("MAILER_SENDER_ADDRESS") }

    # Set URL options to be able to use url_for helpers
    config.action_mailer.default_url_options = { host: ENV.fetch("HOST"), port: ENV.fetch("PORT") }

    # Add HOST to allowed list
    config.hosts << ENV.fetch("HOST")
  end
end
