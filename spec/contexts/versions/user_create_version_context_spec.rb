RSpec.describe UserCreateVersionContext do
  let(:user)      { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
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

  it 'creates a version' do
    expect do
      described_class.call(user_id: user.id,
                           project_id: project.id,
                           checklist_id: checklist.id,
                           params: params)
    end.to change { VersionRepository.count }.from(0).to(1)
  end

  it 'creates a version with a title' do
    version = described_class.call(user_id: user.id,
                                   project_id: project.id,
                                   checklist_id: checklist.id,
                                   params: params)
    expect(version.title).to eq('Website')
  end

  it 'creates a version with tests' do
    version = described_class.call(user_id: user.id,
                                   project_id: project.id,
                                   checklist_id: checklist.id,
                                   params: params)
    expect(version.tests).to eq([test])
  end
end
