source "https://rubygems.org"

ruby "2.7.1"

gem "pg"

gem "rails", "~> 6.0.3"

# assets
gem "autoprefixer-rails"
gem "aws-sdk-s3"
gem "foundation-icons-sass-rails"
gem "foundation-rails"
gem "image_processing"
gem "premailer-rails"
gem "sass-rails", "~> 6.0.0"
gem "uglifier", ">= 2.7.2"
gem "webpacker"

# views
gem "active_link_to"
gem "inky-rb", require: "inky"
gem "meta-tags"
gem "simple_form"
gem "slim"

# all other gems
gem "action_policy"
gem "bootsnap"
gem "decent_decoration"
gem "decent_exposure"
gem "devise"
gem "draper"
gem "flamegraph"
gem "google-analytics-rails"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "puma"
gem "rack-canonical-host"
gem "rack-cors"
gem "rack-mini-profiler", require: false, git: "https://github.com/MiniProfiler/rack-mini-profiler.git"
gem "responders"
gem "rollbar"
gem "secure_headers"
gem "seedbank"
gem "shrine"
gem "stackprof"

group :staging, :production do
  gem "newrelic_rpm"
end

group :test do
  gem "capybara"
  gem "capybara-email"
  gem "database_cleaner"
  gem "formulaic"
  gem "guard-rspec"
  gem "launchy"
  gem "rspec-its"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "terminal-notifier-guard"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "letter_opener"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end
