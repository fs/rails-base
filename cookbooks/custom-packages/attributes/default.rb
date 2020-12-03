# Specify packages and version numbers to be installed here
#
# Search for packages on instances using: eix <package name> 
# Or go to the dashboard and edit the packages for an application to view *unmasked* packages
# Note that the dashboard view will not list masked packages
#
# Examples below:
default['packages'].tap do |packages|
  packages['install'] = [
    {'name' => "dev-lang/erlang", 'version' => "18.3"},
    {'name' => "dev-lang/elixir", 'version' => "1.2.5"},
    {'name' => "media-gfx/wkhtmltopdf-bin", 'version' => "0.12.2.1-r1"},
    {'name' => "dev-util/lockrun", 'version' => "20120508"}
  ]
end
