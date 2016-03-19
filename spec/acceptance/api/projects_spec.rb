require 'acceptance_helper'

RSpec.resource 'Projects' do
  header 'Accept',       'application/json'
  header 'Content-Type', 'application/json'
  header 'token-type',   'Bearer'
  header 'access-token', :access_token
  header 'token-type',   :token_type
  header 'client',       :client_header
  header 'expiry',       :expiry
  header 'uid',          :uid

  let(:user)          { Factories.create_user }
  let!(:project)      { Factories.create_project(user: user) }
  let(:token_headers) { user.create_new_auth_token }
  let(:access_token)  { token_headers['access-token'] }
  let(:token_type)    { token_headers['token-type'] }
  let(:client_header) { token_headers['client'] }
  let(:expiry)        { token_headers['expiry'] }
  let(:uid)           { token_headers['uid'] }

  get '/api/projects/:id' do
    let(:id) { project.id }
    example_request 'Show Project' do
      expect(status).to eq(200)
    end
  end

  get '/api/projects' do
    example_request 'List Projects' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects' do
    parameter :'data.title', "The Project's title"

    let(:raw_post) do
      { data: { title: 'Azendoo' } }.to_json
    end
    example_request 'Create Project' do
      expect(status).to eq(200)
    end
  end

  put '/api/projects/:id' do
    parameter :'data.title', "The Project's title"
    let(:id) { project.id }
    let(:raw_post) do
      { data: { title: 'Azendoo' } }.to_json
    end
    example_request 'Update Project' do
      expect(status).to eq(200)
    end
  end

  delete '/api/projects/:id' do
    let(:id) { project.id }
    example_request 'Delete Project' do
      expect(status).to eq(200)
    end
  end
end
