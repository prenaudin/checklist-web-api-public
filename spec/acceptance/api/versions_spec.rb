require 'acceptance_helper'

RSpec.resource 'Versions' do
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
  let!(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end
  let(:access_token)  { token_headers['access-token'] }
  let(:token_type)    { token_headers['token-type'] }
  let(:client_header) { token_headers['client'] }
  let(:expiry)        { token_headers['expiry'] }
  let(:uid)           { token_headers['uid'] }

  get '/api/projects/:project_id/checklists/:checklist_id/versions' do
    let(:project_id)   { project.id }
    let(:checklist_id) { checklist.id }

    example_request 'List Versions' do
      expect(status).to eq(200)
    end
  end

  post '/api/projects/:project_id/checklists/:checklist_id/versions' do
    parameter :'data.title', "The Version's title"
    parameter :'data.test_suite', 'An array of tests'

    let(:project_id)   { project.id }
    let(:checklist_id) { checklist.id }
    let(:test) do
      {
        'id'           => '1',
        'title'        => 'Deploy',
        'comment'      => '',
        'status'       => 'ok',
        'show_comment' => false
      }
    end
    let(:params) do
      { title: 'Website', tests: [test] }
    end
    let(:raw_post) do
      { data: params }.to_json
    end

    example_request 'Create Version' do
      expect(status).to eq(200)
    end
  end

  put '/api/projects/:project_id/checklists/:checklist_id/versions/:id' do
    let(:project_id)   { project.id }
    let(:checklist_id) { checklist.id }
    let(:id)           { version.id }
    let(:test) do
      {
        'id'           => '2',
        'title'        => 'Login',
        'comment'      => '',
        'status'       => 'nok',
        'show_comment' => false
      }
    end
    let(:params) do
      { title: 'App', tests: [test] }
    end
    let(:raw_post) do
      { data: params }.to_json
    end

    example_request 'Update Version' do
      expect(status).to eq(200)
    end
  end

  delete '/api/projects/:project_id/checklists/:checklist_id/versions/:id' do
    let(:project_id)   { project.id }
    let(:checklist_id) { checklist.id }
    let(:id)           { version.id }

    example_request 'Delete Version' do
      expect(status).to eq(200)
    end
  end
end
