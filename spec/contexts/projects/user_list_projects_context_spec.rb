RSpec.describe UserListProjectsContext do
  let(:user)        { Factories.create_user }
  let(:user_bis)    { Factories.create_user }
  let(:project)     { Factories.create_project(user: user) }
  let(:project_bis) { Factories.create_project(user: user) }

  it 'list all the user projects' do
    expect(described_class.call(user_id: user.id))
      .to match_array([project, project_bis])
  end

  it 'list projects even if none' do
    expect(described_class.call(user_id: user_bis.id))
      .to match_array([])
  end
end
