source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.1.2'
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
  # FIXME: Required for fixing warning
  # https://github.com/rspec/rspec-rails/pull/772.
  # Going to be fixed in rspec > 2.99
  #
  gem 'minitest'

  gem 'fuubar'
  gem 'jazz_hands'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'rubocop'
  gem 'bundler-audit'
end

group :test do
  gem 'webmock', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'turnip'
  gem 'codeclimate-test-reporter', require: false
end

group :staging do
  gem 'mail_safe'
end

group :staging, :production do
  gem 'rails_12factor'
end
