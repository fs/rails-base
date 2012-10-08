include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

version = node.ruby.version
rbenv_ruby version do
  global true
end

rbenv_gem 'bundler' do
  ruby_version node.ruby.version
  version node.ruby.bundler_version
end
