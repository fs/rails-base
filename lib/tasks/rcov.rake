begin
  require 'cucumber/rake/task'
  require 'rspec/rails'
  require 'rspec/core/rake_task'

  desc 'Run both specs and features to generate aggregated coverage'
  task :rcov => 'rcov:all'

  namespace :rcov do
    def rcov_opts
      ['--exclude ".rvm/*,osx/objc,gems/*,spec/*,features/*,.bundle/*"',
        '--rails',
        '--aggregate "tmp/rcov.txt"'
      ]
    end

    Cucumber::Rake::Task.new(:cucumber, 'Run cucumber to generate coverage') do |t|
      t.rcov = true
      t.rcov_opts = rcov_opts
    end

    desc 'Run specs to generate coverage'
    RSpec::Core::RakeTask.new(:rspec) do |t|
      t.rcov = true
      t.rcov_opts = rcov_opts
    end

    task :all do |t|
      Rake::Task['rcov:cucumber'].invoke
      Rake::Task['rcov:rspec'].invoke
    end
  end
rescue LoadError
  desc 'cucumber rake task not available (cucumber not installed)'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
