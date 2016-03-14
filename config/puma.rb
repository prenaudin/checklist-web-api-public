# coding: utf-8
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || ENV['PUMA_MAX_THREADS'] || 1)
threads threads_count, threads_count
workers Integer(ENV['PUMA_WORKERS'] || ENV['WEB_CONCURRENCY'] || 2)

port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
