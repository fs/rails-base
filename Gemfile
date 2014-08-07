source 'https://rubygems.org'

ruby '2.1.2'

# rails stuff
gem 'rails', '4.1.4'
gem 'pg'

#views
gem 'slim'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
gem 'simple_form', '~> 3.0.2'
gem 'github-markdown' # only for dashboard controller

#css/js
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails'
gem 'autoprefixer-rails'

gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'

#etc
gem 'simple-navigation'
gem 'devise'
gem 'decent_exposure'
gem 'kaminari'
gem 'title'
gem 'rollbar', '~> 0.10.3'
gem 'seedbank'
gem 'thin'

group :staging, :production do
  gem 'rails_12factor'
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
  gem 'styleguides'
end
