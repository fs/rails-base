require "bundler/capistrano"

server "178.79.128.15", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "rails3-base"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:fs/#{application}.git"
set :branch, "deploy"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :default_environment, {
  'PATH' => '/opt/rbenv/shims:/opt/rbenv/bin:$PATH'
}

namespace :config do
  desc "Symlink the database.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "config:symlink"
end

namespace :unicorn do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :app do
      run "service unicorn_#{application} #{command}"
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
end

after "deploy", "deploy:cleanup" # keep only the last 5 releases
