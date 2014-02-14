source 'https://rubygems.org'

# Specify ruby version for Heroku
ruby '2.1.0'

gem 'rails', '4.0.0'
gem 'json'
gem 'pg'

gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

gem 'devise', '~> 3.0.0'
gem 'simple-navigation'
gem 'simple_form', '~> 3.0.0rc'
gem 'decent_exposure'
gem 'kaminari'
gem 'slim'
gem 'thin'
gem 'rollbar', '~> 0.10.3'

gem 'github-markdown' # only for dashboard controller


gem 'sass-rails', '~> 4.0.0'
gem 'foundation-rails'
gem 'compass-rails'

group :development do
  gem 'styleguides'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
  gem 'mail_safe'
end

group :development, :test do
  gem 'fuubar'
  gem 'jazz_hands'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'rubocop'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'turnip'
end

group :staging, :production do
  gem 'rails_12factor'
end
