RSpec.describe UserUpdateVersionContext do
  let(:user)      { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end

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

  it 'updates the version title' do
    version_returned = described_class.call(user_id: user.id,
                                            project_id: project.id,
                                            checklist_id: checklist.id,
                                            version_id: version.id,
                                            params: params)
    expect(version_returned.title).to eq(params[:title])
  end

  it 'updates the version tests' do
    version_returned = described_class.call(user_id: user.id,
                                            project_id: project.id,
                                            checklist_id: checklist.id,
                                            version_id: version.id,
                                            params: params)
    expect(version_returned.tests).to eq(params[:tests])
  end
end
