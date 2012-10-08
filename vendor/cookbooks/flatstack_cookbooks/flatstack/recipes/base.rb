include_recipe 'apt'
include_recipe 'hostname'
include_recipe 'vim'
include_recipe 'git'

package 'nano' do
  action :remove
end