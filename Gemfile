source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.4'

# Database
gem 'pg'

# CoffeeScript support
gem 'coffee-rails', '~> 4.0.0'

# Javascript
gem 'jquery-rails'
gem 'therubyracer', platforms: :ruby

# Authentication
gem 'devise'

# Helpers
gem 'decent_exposure'
gem 'simple_form', '~> 3.0.2'
gem 'simple-navigation'

# Paginator
gem 'kaminari'

# Appserver
gem 'thin'

# Error tracking
gem 'rollbar', '~> 0.10.3'

# Title translations
gem 'title'

# Views
gem 'foundation-rails'
gem 'github-markdown' # only for dashboard controller
gem 'slim'

# Structure seed data
gem 'seedbank'

group :staging, :production do
  gem 'rails_12factor'
end

group :assets do
  gem 'autoprefixer-rails'
  gem 'compass-rails'
  gem 'foundation-icons-sass-rails'
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'site_prism'
  gem 'webmock', require: false
end

group :development, :test do
  gem 'bundler-audit'
  gem 'dotenv-rails' # Load environment variables from .env into ENV
  gem 'factory_girl_rails'
  gem 'jazz_hands'

  # Code analyzers
  gem 'brakeman', require: false
  gem 'rails_best_practices'
  gem 'rubocop'

  # RSpec
  gem 'rspec-rails', '~> 3.0'
  gem 'fuubar', '~> 2.0.0.rc1'
end

group :development do
  gem 'bullet' # Kill N+1 queries and unused eager loading
  gem 'foreman' # Development server
  gem 'quiet_assets' # Turn off the Rails asset pipeline log
  gem 'letter_opener' # Email preview in the browser
  gem 'slim-rails' # Views generator
  gem 'styleguides'
end
