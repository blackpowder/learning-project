set :repository,  "set your repository location here"

set :application, "craftodex"
set :repository,  "git@github.com:blackpowder/learning-project.git"
set :use_sudo,    false

set :normalize_asset_timestamps, false
default_run_options[:shell] = '/bin/bash --login'

set :scm, :git

task :staging do
  set :user,      "www"
  set :domain,    "craftworks.enspiral.info"
  set :branch,    "master"
  set :rails_env, "staging"
  set :deploy_to, "/home/#{user}/#{application}/"
  set :deploy_subdir, "craftworks-info/craftodex"
  set :bundle_without, [:development, :test]

  role :web, domain
  role :app, domain
  role :db,  domain, :primary => true
end

after "deploy:update_code", "site:symlink"

namespace :site do
  task :symlink do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end

require "bundler/capistrano"

#set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :bundle_flags, "--deployment --binstubs --shebang ruby-local-exec"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

