RSpec.describe UserUpdateProjectContext do
  let(:user)     { Factories.create_user }
  let(:user_bis) { Factories.create_user }
  let(:project)  { Factories.create_project(user: user) }
  let(:params)   { ActionController::Parameters.new(title: 'Azendoo') }

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id,
                           params: params)
    end
      .to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns the project' do
    expect(described_class.call(user_id: user.id,
                                project_id: project.id,
                                params: params))
      .to eq(project)
  end
end
