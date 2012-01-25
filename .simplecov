SimpleCov.start do
  add_filter '/test/'
  add_filter '/spec/'
  add_filter '/autotest/'
  add_filter '/features/support/'
  add_filter '/config/'
  add_filter '/db/'
  add_filter '/vendor/bundle/'
  add_filter '/vendor/ruby/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Mailers', 'app/mailers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
  add_group 'Plugins', 'vendor/plugins'
  add_group "Cucumber Steps", "/features/step_definitions/" # will help remove unused steps
end

