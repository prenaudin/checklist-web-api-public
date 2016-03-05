source 'https://rubygems.org'
ruby '2.3.0'

gem 'puma'
gem 'rack-cors', require: 'rack/cors'

gem 'pg'

gem 'rails', '4.2.5'
gem 'rails-api', '~> 0.4.0'
gem 'active_model_serializers', '~> 0.10.0.rc3'
gem 'devise', '~> 3.5.3'
gem 'devise_token_auth'
gem 'omniauth'
gem 'gravatarify', '~> 3.1.1'

group :development, :test do
  gem 'foreman'
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'json_matchers'
end

group :production do
  gem 'rails_12factor'
end
