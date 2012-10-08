if node.users.deployer.ssh_keys.empty?
  Chef::Log.fatal <<-ERROR

      Please setup ssh keys for newlly created user "#{node.users.deployer.user}" in the `node.users.deployer.ssh_keys`
      Or you will lose any access to to the server in case we disable password authentication
  ERROR

  exit(0)
end

user_account node.users.deployer.user do
  shell node.users.deployer.shell || '/bin/bash'
  ssh_keys node.users.deployer.ssh_keys
  action :create
end
