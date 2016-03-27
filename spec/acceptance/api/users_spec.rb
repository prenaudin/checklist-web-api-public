require 'acceptance_helper'

RSpec.resource 'Users' do
  header 'Accept',       'application/json'
  header 'Content-Type', 'application/json'
  header 'token-type',   'Bearer'
  header 'access-token', :access_token
  header 'token-type',   :token_type
  header 'client',       :client_header
  header 'expiry',       :expiry
  header 'uid',          :uid

  let(:user)          { Factories.create_user }
  let(:token_headers) { user.create_new_auth_token }
  let(:access_token)  { token_headers['access-token'] }
  let(:token_type)    { token_headers['token-type'] }
  let(:client_header) { token_headers['client'] }
  let(:expiry)        { token_headers['expiry'] }
  let(:uid)           { token_headers['uid'] }

  get '/api/me' do
    example_request 'Show Current User' do
      expect(status).to eq(200)
    end
  end
end
