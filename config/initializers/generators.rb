Rails3Base::Application.configure do
  config.generators do |g|
    g.stylesheets false
    g.fixture false
    g.helper false
    g.integration_tool false

    g.test_framework  :rspec
    g.controller_specs false
    g.helper_specs false
    g.routing_specs false
    g.view_specs false
  end
end
