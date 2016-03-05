namespace :assets do
  desc 'Compile assets with webpack'
  task :webpack do
    sh 'NODE_ENV=production $(npm bin)/webpack --config config/webpack/production.config.js'
  end

  task :precompile => :webpack
end
