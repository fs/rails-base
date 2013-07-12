source 'https://rubygems.org'

# Specify ruby version for Heroku
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'json'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.2.3'

  gem 'therubyracer', platforms: :ruby
  gem 'less-rails-bootstrap'

  gem 'styleguides'
end

gem 'jquery-rails'

gem 'devise', github: 'plataformatec/devise', branch: 'rails4'
gem 'simple-navigation'
gem 'simple_form', '~> 3.0.0rc'
gem 'decent_exposure'
gem 'kaminari'
gem 'slim'
gem 'thin'
gem 'airbrake'

gem 'github-markdown' # only for dashboard controller

group :development do
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
  gem 'guard'
  gem "spin", github: "rickyrobinson/spin", branch: "cucumber"
  gem "guard-spin", github: "rickyrobinson/guard-spin", branch: "cucumber"
  gem "guard-spin_rspec", github: "rickyrobinson/guard-spin_rspec"
end

group :development, :test do
  gem 'debugger'
  gem 'dotenv'
  gem 'rspec-rails'
  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'brakeman'
  gem 'factory_girl_rails'
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