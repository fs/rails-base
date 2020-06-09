Rails.application.config.app_generators do |g|
  g.stylesheets false
  g.helper false
  g.integration_tool false
  g.fixture_replacement(:factory_bot, dir: "spec/factories")
  g.test_framework(
    :rspec,
    controller_specs: false,
    helper_specs: false,
    routing_specs: false,
    view_specs: false
  )
end

# Make `form_with` generate non-remote forms.
Rails.application.config.action_view.form_with_generates_remote_forms = false

# Make `form_with` generate id attributes for any generated HTML tags.
Rails.application.config.action_view.form_with_generates_ids = true
