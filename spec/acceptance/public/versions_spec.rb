require 'acceptance_helper'

RSpec.resource 'Versions' do
  header 'Accept',       'application/json'
  header 'Content-Type', 'application/json'

  let(:user)                 { Factories.create_user }
  let!(:project)             { Factories.create_project(user: user) }
  let!(:destination_project) { Factories.create_project(user: user) }
  let!(:checklist) do
    Factories.create_checklist(user: user, project: project)
  end
  let!(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist,
                             public_token: 'a' * 24)
  end

  get 'public/versions/:id' do
    let(:id) { version.public_slug }

    example_request 'Show Public Version' do
      expect(status).to eq(200)
    end
  end
end
