Rails3Base::Application.configure do
  config.generators do |g|
    g.stylesheets false
    g.fixture false
    g.helper false
    g.integration_tool false
    g.test_framework  :rspec, :controller_specs => false, :helper_specs => false, :routing_specs => false, :view_specs => false
  end
end
