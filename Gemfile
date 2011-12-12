source :rubygems

gem 'rails'

# Asset template engines
gem 'json'
gem 'sass-rails'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

gem 'configatron'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'simple-navigation'
gem 'simple_form'
gem 'client_side_validations'
gem 'tabletastic', :git => 'git://github.com/fs/tabletastic.git'
gem 'flutie'
gem 'bourbon'
gem 'inherited_resources'
gem 'kaminari'

group :development do
  gem 'heroku'

  gem 'rails_best_practices'
  gem 'ripper'
  
  gem 'rails3-generators'
  gem 'rcov'
end

group :development, :test do
  gem 'sqlite3-ruby'
end

group :test do
  gem 'database_cleaner'

  gem 'rr'
  gem 'rspec-rails'  
  gem 'shoulda-matchers'  
  gem 'email_spec'  
  gem 'factory_girl_rails'

  gem 'cucumber-rails'
  gem 'pickle'
  gem 'webmock', :require => false
  gem 'launchy'
end

group :staging, :production do
  gem 'mysql2'
end