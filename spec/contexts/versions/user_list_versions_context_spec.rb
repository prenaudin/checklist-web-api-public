RSpec.describe UserListVersionsContext do
  let(:user)      { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:version) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end
  let(:version_bis) do
    Factories.create_version(user: user,
                             project: project,
                             checklist: checklist)
  end

  it 'list all user versions' do
    expect(described_class.call(user_id: user.id,
                                project_id: project.id,
                                checklist_id: checklist.id))
      .to match_array([version, version_bis])
  end

  it 'list versions even if none' do
    expect(described_class.call(user_id: user.id,
                                project_id: project.id,
                                checklist_id: checklist.id))
      .to match_array([])
  end
end
