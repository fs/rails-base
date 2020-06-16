Capybara.configure do |config|
  config.match = :prefer_exact
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end

Capybara.javascript_driver = :selenium_chrome_headless
