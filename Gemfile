source :rubygems

gem 'rails'
gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'styleguides'
  gem 'bourbon'
end

gem 'jquery-rails'

gem 'configatron'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'simple-navigation'
gem 'simple_form'
gem 'client_side_validations'
gem 'tabletastic'
gem 'inherited_resources'
gem 'kaminari'
gem 'slim'

group :development do
  gem 'heroku'

  gem 'rails_best_practices'
  gem 'ripper'
  
  gem 'brakeman'
  
  gem 'rails3-generators'
  gem 'rcov'
end

group :development, :test do
  gem 'sqlite3-ruby'
  gem 'rspec-rails'
  gem 'mail_safe'  
end

group :test do
  gem 'database_cleaner'
  gem 'rr'
  gem 'shoulda-matchers'  
  gem 'email_spec'  
  gem 'factory_girl_rails'

  gem 'cucumber-rails'
  gem 'webmock', :require => false
  gem 'launchy'
  
  gem 'ruby-debug'  
end

group :staging, :production do
  gem 'mysql2'
end