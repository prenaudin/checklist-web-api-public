source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'devise', '4.0.0.rc1'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth',
                         branch: 'master'
gem 'active_model_serializers', '~> 0.10.0.rc5'
gem 'omniauth'

gem 'puma'
gem 'rack-cors'

gem 'rake', '> 10'

gem 'skylight'

group :development, :test do
  gem 'foreman'
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'annotate'
end

group :test do
  gem 'rspec',              github: 'rspec/rspec'
  gem 'rspec-rails',        github: 'rspec/rspec-rails'
  gem 'rspec-core',         github: 'rspec/rspec-core'
  gem 'rspec-support',      github: 'rspec/rspec-support'
  gem 'rspec-expectations', github: 'rspec/rspec-expectations'
  gem 'rspec-mocks',        github: 'rspec/rspec-mocks'
  gem 'rspec_api_documentation', github: 'zipmark/rspec_api_documentation'
end

group :production do
  gem 'rails_12factor'
end
