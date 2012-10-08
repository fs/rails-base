#!/usr/bin/env rake

desc "Runs foodcritic linter"
task :foodcritic do
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox = File.join(File.dirname(__FILE__), %w{tmp foodcritic cookbook})
    prepare_foodcritic_sandbox(sandbox)

    sh "foodcritic --epic-fail any --tags ~FC001 #{File.dirname(sandbox)}"
    cleanup_foodcritic_sandbox(sandbox)
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc "Checks ruby syntax"
task :syntax do
  sh "for file in $(find -name '*.rb'); do ruby -c $file > /dev/null || exit 1; done"
end

task :default do
  Rake::Task["syntax"].execute
  Rake::Task["foodcritic"].execute
end

private

def prepare_foodcritic_sandbox(sandbox)
  files = %w{*.md *.rb attributes definitions files libraries providers
recipes resources templates}

  rm_rf sandbox
  mkdir_p sandbox
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox
  puts "\n\n"
end

def cleanup_foodcritic_sandbox(sandbox)
  rm_rf sandbox
end