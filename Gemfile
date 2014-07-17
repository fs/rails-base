source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'pg'

gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

gem 'devise'
gem 'simple-navigation'
gem 'simple_form', '~> 3.0.2'
gem 'decent_exposure'
gem 'kaminari'
gem 'slim'
gem 'thin'
gem 'rollbar', '~> 0.10.3'
gem 'title'

gem 'github-markdown' # only for dashboard controller

gem 'sass-rails', '~> 4.0.0'
gem 'foundation-rails'
gem 'compass-rails'
gem 'foundation-icons-sass-rails'
gem 'autoprefixer-rails'
gem 'seedbank'

group :development do
  gem 'styleguides'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
end

group :development, :test do
  gem 'fuubar', '~> 2.0.0.rc1'
  gem 'jazz_hands'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'

  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'rubocop'
  gem 'bundler-audit'
end

group :test do
  gem 'webmock', require: false
  gem 'capybara'
  gem 'site_prism'
  gem 'formulaic'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'codeclimate-test-reporter', require: false
end

group :staging, :production do
  gem 'rails_12factor'
end
