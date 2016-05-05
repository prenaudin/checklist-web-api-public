RSpec.describe UserShowVersionContext do
  let(:user)      { Factories.create_user }
  let(:user_bis)  { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end

  it 'raises an error if the version is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id,
                           checklist_id: checklist.id,
                           version_id: version.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns the version' do
    expect(described_class.call(user_id: user.id,
                                project_id: project.id,
                                checklist_id: checklist.id,
                                version_id: version.id))
      .to eq(version)
  end
end
