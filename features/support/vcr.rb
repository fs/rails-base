require 'vcr'
require 'capybara/mechanize/cucumber'

VCR.config do |c|
  c.cassette_library_dir = 'features/cassettes'
  c.stub_with :webmock
  c.ignore_localhost = true
  c.default_cassette_options = {
      :record => :new_episodes,
      :re_record_interval => 7.days
  }
end

# Save cassettes in the separate directory per scenario
# And use mechanize driver for remote testing
#
Around('@vcr') do |scenario, block|
  default_driver, default_host = Capybara.current_driver, Capybara.default_host

  Capybara.current_driver = :mechanize
  Capybara.default_host = 'test.cucumber'

  VCR.use_cassette(
    "#{File.basename(scenario.feature.file, '.feature')}/#{scenario.name.parameterize.underscore}",
    {}
  ) do
    block.call
  end

  Capybara.current_driver = default_driver
  Capybara.default_host = default_host
end
