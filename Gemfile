source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'devise', '4.0.0.rc1'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth',
                         branch: 'master'
gem 'active_model_serializers', '~> 0.10.0.rc3'
gem 'omniauth'

gem 'puma'
gem 'rack-cors'

gem 'rake', '~> 10.0.0'

group :development, :test do
  gem 'foreman'
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'json_matchers'
end

group :production do
  gem 'rails_12factor'
end
