HEROKU = ENV['USER'].match(/^repo\d+/)

source 'http://rubygems.org'

gem 'mysql', '2.8.1'
gem 'sqlite3-ruby', '1.3.1'
gem 'rails', '3.0.0'

gem 'devise', '1.1.1'
gem 'simple-navigation', '2.7.3'
gem 'formtastic', '1.1.0'
gem 'flutie', '1.0.4'

# Heroku hack b/c we don't want use these gem on heroku env
unless HEROKU
  group :test do
    gem 'redgreen', '1.2.2'
    gem 'rr', '0.10.9'
    gem 'factory_girl_rails'
    gem 'pickle', '0.4.2'

    gem 'rspec-rails', '>= 2.0.0.beta.20'
    gem 'cucumber', '0.8.5'
    gem 'cucumber-rails', '0.3.2'
    gem 'launchy'
    gem 'capybara', '0.3.8'
    gem 'autotest-rails', '4.1.0'
    gem 'autotest', '4.3.2'

    gem 'ruby-debug', '0.10.3'
  end
end