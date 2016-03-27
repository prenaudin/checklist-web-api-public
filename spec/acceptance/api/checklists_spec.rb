require 'acceptance_helper'

RSpec.resource 'Checklists' do
  header 'Accept',       'application/json'
  header 'Content-Type', 'application/json'
  header 'token-type',   'Bearer'
  header 'access-token', :access_token
  header 'token-type',   :token_type
  header 'client',       :client_header
  header 'expiry',       :expiry
  header 'uid',          :uid

  let(:user)                 { Factories.create_user }
  let(:token_headers)        { user.create_new_auth_token }
  let!(:project)             { Factories.create_project(user: user) }
  let!(:destination_project) { Factories.create_project(user: user) }
  let!(:checklist) do
    Factories.create_checklist(user: user, project: project)
  end
  let(:access_token)  { token_headers['access-token'] }
  let(:token_type)    { token_headers['token-type'] }
  let(:client_header) { token_headers['client'] }
  let(:expiry)        { token_headers['expiry'] }
  let(:uid)           { token_headers['uid'] }

  get '/api/projects/:project_id/checklists/:id' do
    let(:project_id) { project.id }
    let(:id)         { checklist.id }

    example_request 'Show Checklist' do
      expect(status).to eq(200)
    end
  end

  get '/api/projects/:project_id/checklists' do
    let(:project_id) { project.id }

    example_request 'List Checklists' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects/:project_id/checklists' do
    parameter :'data.title', "The Checklist's title"
    parameter :'data.test_suite', "An array of tests' title"

    let(:project_id) { project.id }
    let(:raw_post) do
      { data: { title: 'QA', test_suite: ['Task 1', 'Task 2'] } }.to_json
    end
    example_request 'Create Checklist' do
      expect(status).to eq(200)
    end
  end

  put '/api/projects/:project_id/checklists/:id' do
    parameter :'data.title', "The new Checklist's title"
    parameter :'data.test_suite', "A new array of tests' title"

    let(:project_id) { project.id }
    let(:id)         { checklist.id }
    let(:raw_post) do
      { data: { title: 'QA Frontend',
                test_suite: ['Task 1', 'Task 2', 'Task 3'] } }.to_json
    end
    example_request 'Update Checklist' do
      expect(status).to eq(200)
    end
  end

  delete '/api/projects/:project_id/checklists/:id' do
    let(:project_id) { project.id }
    let(:id)         { checklist.id }

    example_request 'Delete Checklist' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects/:project_id/checklists/:id/share' do
    let(:project_id) { project.id }
    let(:id)         { checklist.id }

    example_request 'Share Checklist' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects/:project_id/checklists/:id/unshare' do
    let(:project_id) { project.id }
    let(:id)         { checklist.id }

    example_request 'Unshare Checklist' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects/:project_id/checklists/:id/copy' do
    parameter :'data.project', 'The project where the copy will be created'

    let(:project_id) { project.id }
    let(:id)         { checklist.id }
    let(:raw_post) do
      { data: { project: destination_project.id } }.to_json
    end

    example_request 'Copy Checklist' do
      expect(status).to eq(200)
    end
  end
end
