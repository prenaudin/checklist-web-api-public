RSpec.describe UserDeleteChecklistContext do
  let(:user)        { Factories.create_user }
  let(:user_bis)    { Factories.create_user }
  let(:project)     { Factories.create_project(user: user) }
  let(:project_bis) { Factories.create_project(user: user) }
  let(:checklist)   { Factories.create_checklist(user: user, project: project) }

  it 'returns true' do
    returned = described_class.call(user_id: user.id,
                                    project_id: project.id,
                                    checklist_id: checklist.id)
    expect(returned).to be(true)
  end

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id,
                           checklist_id: checklist.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'raises an error if the checklist is not in the project' do
    expect do
      described_class.call(user_id: user.id,
                           project_id: project_bis.id,
                           checklist_id: checklist.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end
end
