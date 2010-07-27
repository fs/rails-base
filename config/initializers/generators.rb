Features::Application.configure do
  config.generators do |g|
    g.template_engine :erb
    g.integration_tool :cucumber
    g.test_framework  :rspec, :fixture => true, :views => false
  end
end
