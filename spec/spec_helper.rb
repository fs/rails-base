# Do not run simplecov on CI
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'turnip/capybara'

paths = Dir[Rails.root.join('spec/**/{support,step_definitions}/**/*.rb')]
paths.each { |file| require file }

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.include Rails.application.routes.url_helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
