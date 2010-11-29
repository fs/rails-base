require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'features/cassettes'
  c.stub_with :webmock
  c.ignore_localhost = true
  c.default_cassette_options = {
      :record => :none,
      :re_record_interval => 7.days
  }
end

Around('@vcr') do |scenario, block|
  VCR.use_cassette(
    "#{File.basename(scenario.feature.file, '.feature')}/#{scenario.name.parameterize.underscore}",
    options,
    &block
  )
end
