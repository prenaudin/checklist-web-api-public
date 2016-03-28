RSpec.describe UserDeleteVersionContext do
  let(:user)      { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let!(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end

  it 'deletes the version' do
    expect do
      described_class.call(user_id: user.id,
                           project_id: project.id,
                           checklist_id: checklist.id,
                           version_id: version.id)
    end.to change { VersionRepository.count }.from(1).to(0)
  end
end
