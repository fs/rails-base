source "https://rubygems.org"

ruby "2.2.4"

gem "rails", "4.2.3"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails"
gem "jquery-rails"
gem "sass-rails", "~> 5.0.0"
gem "skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 1.3.0"

# views
gem "active_link_to"
gem "metamagic"
gem "simple_form"
gem "slim"

# all other gems
gem "decent_exposure"
gem "devise"
gem "google-analytics-rails"
gem "interactor"
gem "kaminari"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "responders"
gem "rollbar", "~> 0.10.3"
gem "seedbank"
gem "thin"
gem "pundit"
gem "rack-canonical-host"

group :staging, :production do
  gem "rails_12factor"
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "fuubar", "~> 2.0.0.rc1"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices"
  gem "rspec-rails", "~> 3.0"
  gem "rubocop"
  gem "scss_lint", require: false
end

group :development do
  gem "bullet"
  gem "foreman"
  gem "letter_opener"
  gem "quiet_assets"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console", "~> 2.0"
end
