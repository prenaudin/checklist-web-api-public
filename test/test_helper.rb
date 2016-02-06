ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def user_authentication_headers(user)
    auth_headers = user.create_new_auth_token
    auth_headers
  end

  def be_jsonapi_response_for(body, model)
    parsed_actual = JSON.parse(body)
    puts parsed_actual[:data][:type]
    parsed_actual.dig('data', 'type') == model &&
      parsed_actual.dig('data', 'attributes').is_a?(Hash) &&
      parsed_actual.dig('data', 'relationships').is_a?(Hash)
  end
end
