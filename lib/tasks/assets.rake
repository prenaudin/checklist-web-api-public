Rake::Task['assets:precompile']
  .clear_prerequisites
  .clear
  .enhance(['assets:compile_environment'])

namespace :assets do
  # In this task, set prerequisites for the assets:precompile task
  task compile_environment: :webpack do
    Rake::Task['assets:environment'].invoke
  end

  desc 'Compile assets with webpack'
  task :webpack do
    sh 'NODE_ENV=production $(npm bin)/webpack --config config/webpack/production.config.js'
  end
end
