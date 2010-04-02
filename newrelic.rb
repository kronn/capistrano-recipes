Dir['vendor/gems/newrelic_rpm*/recipes/*.rb'].each { |plugin| load(plugin) }

# We need to run this after our collector mongrels are up and running
# This goes out even if the deploy fails, sadly
after "deploy:update", "newrelic:notice_deployment"
