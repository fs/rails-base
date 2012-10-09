source :rubygems

gem 'rails', '3.2.8'
gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'

  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails-bootstrap'

  gem 'styleguides'
end

gem 'jquery-rails'

gem 'devise'
gem 'simple-navigation'
gem 'simple_form'
gem 'decent_exposure'
gem 'kaminari'
gem 'slim'
gem 'thin'
gem 'airbrake'

gem 'github-markdown' # only for dashboard controller

group :development do
  gem 'letter_opener'
  gem 'heroku'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
end

group :development, :test do
  gem 'debugger'
  gem 'dotenv'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'brakeman'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'turnip'
end

group :staging, :production do
  gem 'pg'
end
