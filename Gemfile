source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.4'

# Database
gem 'pg'

# CoffeeScript support
gem 'coffee-rails', '~> 4.0.0'

# Compression
gem 'uglifier', '>= 1.3.0'

# Javascript
gem 'therubyracer', platforms: :ruby

# Authentication
gem 'devise'

# Helpers
gem 'simple-navigation'
gem 'simple_form', '~> 3.0.2'
gem 'decent_exposure'

# Paginator
gem 'kaminari'

# Appserver
gem 'thin'

# Error tracking
gem 'rollbar', '~> 0.10.3'

# Title translations
gem 'title'

# Views
gem 'jquery-rails'
gem 'slim'
gem 'sass-rails', '~> 4.0.0'
gem 'foundation-rails'
gem 'compass-rails'
gem 'foundation-icons-sass-rails'
gem 'autoprefixer-rails'
gem 'github-markdown' # only for dashboard controller

# Structure seed data
gem 'seedbank'

group :development do
  # Styleguides for designers
  gem 'styleguides'

  # Turn off the Rails asset pipeline log
  gem 'quiet_assets'

  # Email preview in the browser
  gem 'letter_opener'

  # Views generator
  gem 'slim-rails'

  # Development server
  gem 'foreman'

  # Help to kill N+1 queries and unused eager loading
  gem 'bullet'
end

group :development, :test do
  # RSpec (unit tests, integration tests)
  gem 'rspec-rails', '~> 3.0'
  gem 'fuubar', '~> 2.0.0.rc1'

  # Console-related gems
  gem 'jazz_hands'

  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'

  # Set up objects as a test data
  gem 'factory_girl_rails'

  # Code analyzers
  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'rubocop'

  # Patch-level verification for Bundler
  gem 'bundler-audit'
end

group :test do
  # Stub and set expectations on HTTP requests
  gem 'webmock', require: false

  # Integration tests
  gem 'capybara'
  gem 'site_prism'
  gem 'formulaic'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'

  # Collection of testing matchers
  gem 'shoulda-matchers'

  # Test coverage
  gem 'codeclimate-test-reporter', require: false
end

group :staging, :production do
  # Better logging and serving static assets
  gem 'rails_12factor'
end
