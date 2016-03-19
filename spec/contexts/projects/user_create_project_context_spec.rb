RSpec.describe UserCreateProjectContext do
  let(:user) { Factories.create_user }
  let(:params) do ActionController::Parameters.new(title: 'Azendoo') end

  it 'creates the project with right title' do
    expect { described_class.call(user_id: user.id, params: params) }
      .to change { ProjectRepository.count }.from(0).to(1)
  end

  it 'creates the project with a title' do
    project = described_class.call(user_id: user.id, params: params)
    expect(project.title).to eq('Azendoo')
  end

  it 'returns the project' do
    project = described_class.call(user_id: user.id, params: params)
    expect(project).to be_kind_of(Project)
  end
end
