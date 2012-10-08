# Hostname
node.set.set_fqdn = 'application.flatstack.com'

# Deployer ssh keys
node.set.users.deployer.ssh_keys = 'ssh-rsaAAAAB3NzaC1yc2EAAAABIwAAAQEAw+n/Z2kpypd1NVZ3OC8OBy0T5UNs008Tl9neQjp3X9Tx5VZgamczSKx6qHVvE/sOKk17CeInqZQhscyPWNUFRXKUFqSeQp2xff8YS2GlxTTsdBv6MJahA6T569K9iJNaki9VphQ+PIvauV6WrMlXHn0KIK+36l7vnqr19eqwfgKSehgrn+Jo0N3JH7HmY7hohwvgvtUFyTs8tAHv8L8NTH4x30H4UB0vzBGuSWLnSiukTJ5Ut9qZGXHFCBwche2h3aDCxsrVuIg+FLYOI98P78tSr+6aV1dTIYSCe8nDNkpBJvpH0jwuYs956PY4jJIa+yFtopuYCqbR2biinOLy5Q== timurv@Mac-mini-Timur-Vafin.local'

include_recipe 'flatstack::base'

# Ruby version
#   node.set.ruby.version = '1.9.3-p194'
#
# Bundler version
#   node.set.ruby.bundler_version = '1.0.18'
#
include_recipe 'flatstack::ruby'

# Rails application settings
#   node.set.rails.application.name = 'application'
#   node.set.rails.application.root_prefix = '/var/www'
#   node.set.rails.application.domain = 'example.com'
#   node.set.rails.application.environment = 'production'
#   node.set.rails.application.packages = []

include_recipe 'flatstack::rails'
include_recipe 'flatstack::rails_application'
