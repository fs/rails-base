require "capybara/poltergeist"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, window_size: %i[1440 1280])
end

Capybara.configure do |config|
  config.match = :prefer_exact
  config.javascript_driver = :poltergeist
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end
