namespace :application do
  desc "Link the database config into the deployed release"
  task :link_database_config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

