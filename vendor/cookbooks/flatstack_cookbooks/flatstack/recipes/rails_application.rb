directory '/etc/nginx/sites-include' do
  mode 0755
end

application_name = node.rails.application.name
application_environment = node.rails.application.environment
application_domain = node.rails.application.domain

application_root = "#{node.rails.application.root_prefix}/#{application_name}/#{application_environment}"
application_full_name = "#{application_name}_#{node.rails.application.environment}"

# Create application folders
# Need for nginx logs
#
%w(config tmp sockets log tmp/pids system bin).each do |dir|
  directory "#{application_root}/#{dir}" do
    recursive true
    owner node.users.deployer.user
    group node.users.deployer.user
  end
end

# TODO: remove default host, add logrotate
# Setup nginx
#
template "/etc/nginx/sites-include/#{application_full_name}.conf" do
  source 'app_nginx_include.conf.erb'

  variables :application_full_name => application_full_name,
            :application_name => application_name,
            :application_root => application_root

  notifies :reload, resources(:service => 'nginx')
end

template "/etc/nginx/sites-available/#{application_full_name}.conf" do
  source 'app_nginx.conf.erb'

  variables :application_full_name => application_full_name,
            :application_name => application_name,
            :application_domain => application_domain

  notifies :reload, resources(:service => 'nginx')
end

nginx_site application_full_name do
  action :enable
end

# Setup application packages
#
application_packages = node.rails.application.packages
if application_packages
  application_packages.each do |package_name|
    package package_name
  end
end

