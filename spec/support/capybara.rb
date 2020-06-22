Capybara.configure do |config|
  config.match = :prefer_exact
  config.app_host = "http://#{ENV.fetch('HOST')}:#{ENV.fetch('PORT')}"
  config.asset_host = "http://#{ENV.fetch('HOST')}:#{ENV.fetch('PORT')}"
end

Capybara.javascript_driver = :selenium_chrome_headless

Capybara.disable_animation = true
