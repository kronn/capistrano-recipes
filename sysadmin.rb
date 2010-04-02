namespace :apt do
  desc "Update packagelist for aptitude"
  task :update do
    sudo "aptitude update"
    sudo "aptitude -y -s -V -Z safe-upgrade"
  end

  desc "Upgrade packages as recommended by aptitude"
  task :upgrade do
    sudo "sudo aptitude -y safe-upgrade"
  end
end

namespace :apache do
  desc "Restart Apache Webserver"
  task :restart do
    apache_init_script = fetch(:apache_init_script, 'apachectl')
    sudo "#{apache_init_script} restart"
  end
end
