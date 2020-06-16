Capybara.configure do |config|
  config.match = :prefer_exact
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end

Capybara.register_driver :headless_chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: "ALL" })
  opts = Selenium::WebDriver::Chrome::Options.new

  chrome_args = %w[--headless --no-sandbox --disable-gpu --window-size=1920,1080]
  chrome_args.each { |arg| opts.add_argument(arg) }

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome
