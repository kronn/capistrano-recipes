namespace :info do
  desc <<-DESC
    Tail all or a single remote file

    The logfile can be specified with a LOGFILE-environment variable.
    It defaults to RAILS_ENV.log
  DESC
  task :tail, :roles => :app do
    ENV["LOGFILE"] ||= "#{rails_env}.log"
    begin
      stream "tail -f #{shared_path}/log/#{ENV["LOGFILE"]}"
    rescue Interrupt
      puts "\n--interrupted by user--"
      puts ""
    end
  end

  desc "Display the currently deployed Application, Revision and Release"
  task :version, :roles => :app, :except => { :no_release => true } do
    rev = current_revision
    rel = current_release.split('/').pop

    puts ""
    puts "    AppName: #{fetch(:application)}"
    puts "    Version: #{rev}"
    puts "    Release: #{rel}"
    puts ""
  end

  desc "Display the uname"
  task :uname do
    run "uname -a"
  end
end
