source 'https://rubygems.org'

ruby '2.1.5'

# the most important stuff
gem 'rails', '4.1.8'
gem 'pg'

# frontend stack: preprocessors, libraries, minifiers, assets
# plus view stack: helpers, builders, etc.
gem 'sass-rails', '~> 4.0.0'
gem 'slim'
gem 'coffee-rails', '~> 4.0.0'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

gem 'simple_form', '~> 3.0.2'
gem 'active_link_to'
gem 'title'
gem 'github-markdown' # only for dashboard controller

# all other gems
gem 'devise'
gem 'decent_exposure'
gem 'kaminari'
gem 'rollbar', '~> 0.10.3'
gem 'seedbank'
gem 'thin'

group :staging, :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
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
  gem 'awesome_print'
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'fuubar', '~> 2.0.0.rc1'
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop'
end

group :development do
  gem 'bullet'
  gem 'foreman'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
end
