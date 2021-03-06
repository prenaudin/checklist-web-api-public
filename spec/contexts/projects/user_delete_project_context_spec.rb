RSpec.describe UserDeleteProjectContext do
  let(:user) { Factories.create_user }
  let(:user_bis) { Factories.create_user }
  let!(:project) { Factories.create_project(user: user) }

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id, project_id: project.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'deletes the project' do
    expect { described_class.call(user_id: user.id, project_id: project.id) }
      .to change { ProjectRepository.count }.from(1).to(0)
  end
end
