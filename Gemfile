HEROKU = ENV['USER'].match(/^repo\d+/)

source 'http://rubygems.org'

gem 'mysql'
gem 'rails', '3.0.0.beta4'
gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'devise', '1.1.rc2'
gem 'simple-navigation'
gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "rails3"
gem 'flutie'

# Heroku hack b/c we don't want use these gem on heroku env
unless HEROKU
  group :test do
    gem 'redgreen', '1.2.2'
    gem 'rr', '0.10.9'
    gem 'factory_girl_rails'
    gem 'pickle', :git => 'git://github.com/codegram/pickle.git', :ref => '929ee633'

    gem "rspec-rails", ">= 2.0.0.beta.17"
    gem 'cucumber'
    gem 'cucumber-rails'
    gem 'capybara', '0.3.8'
    gem 'autotest-rails'
    gem 'autotest'

    gem 'ruby-debug'
  end
end