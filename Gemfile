source :rubygems

gem 'rails', '3.2.1'
gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # gem 'sass-rails', '~> 3.2.4'
  # gem 'bourbon'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
  gem 'styleguides'
  gem 'less-rails-bootstrap'
end

gem 'jquery-rails'

gem 'devise'
gem 'simple-navigation'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'
gem 'client_side_validations'
gem 'tabletastic'
gem 'inherited_resources'
gem 'kaminari'
gem 'slim'


group :development do
  gem 'heroku'
  gem 'rails_best_practices'
  gem 'brakeman'
  gem 'rails3-generators'
  gem 'slim-rails'
end

group :development, :test do
  gem 'dotenv'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'mail_safe'
end

group :test do
  gem 'simplecov', require: false

  gem 'database_cleaner'
  gem 'rr'
  gem 'shoulda-matchers'
  gem 'email_spec'
  gem 'factory_girl_rails'

  gem 'cucumber-rails'
  gem 'webmock', require: false
  gem 'launchy'

  gem 'ruby-debug19'
end

group :staging, :production do
  gem 'pg'
end