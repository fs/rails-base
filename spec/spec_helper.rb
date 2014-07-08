# Run codeclimate-test-reporter only in CI
if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/sections/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include Rails.application.routes.url_helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include FactoryGirl::Syntax::Methods
  config.include Formulaic::Dsl
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
