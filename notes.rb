namespace :deploy do
  desc "output deployment notes"
  task :output_notes do
    puts `cat doc/DEPLOYMENT_NOTES 2>/dev/null`
  end
end
