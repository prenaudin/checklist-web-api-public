RSpec.describe UserListChecklistsContext do
  let(:user)      { Factories.create_user }
  let(:user_bis)  { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:project_user_bis) do
    Factories.create_project(user: user_bis)
  end
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:checklist_bis) do
    Factories.create_checklist(user: user, project: project)
  end

  it 'list all the checklists in the project' do
    expect(described_class.call(user_id: user.id, project_id: project.id))
      .to match_array([checklist, checklist_bis])
  end

  it 'list checklists even if none' do
    expect(described_class.call(user_id: user_bis.id,
                                project_id: project_user_bis.id))
      .to match_array([])
  end

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end
end
