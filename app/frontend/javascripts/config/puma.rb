workers Integer(ENV['PUMA_WORKERS'] || 1)
threads_count = Integer(ENV['PUMA_MAX_THREADS'] || 1)
threads threads_count, threads_count

preload_app!

port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
