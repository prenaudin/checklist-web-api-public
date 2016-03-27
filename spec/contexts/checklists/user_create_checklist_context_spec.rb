RSpec.describe UserCreateChecklistContext do
  let(:user)        { Factories.create_user }
  let(:user_bis)    { Factories.create_user }
  let(:project)     { Factories.create_project(user: user) }
  let(:project_bis) { Factories.create_project(user: user) }
  let(:test_suite) { ['Task 1', 'Task 2', 'Task 3'] }
  let(:params) do
    {
      title: 'QA',
      test_suite: test_suite
    }
  end

  it 'creates the checklist' do
    expect do
      described_class.call(user_id: user.id,
                           project_id: project.id,
                           params: params)
    end
      .to change { ChecklistRepository.count }.from(0).to(1)
  end

  it 'creates the checklist with a title' do
    checklist = described_class.call(user_id: user.id,
                                     project_id: project.id,
                                     params: params)
    expect(checklist.title).to eq('QA')
  end

  it 'creates the checklist with a test_suite' do
    checklist = described_class.call(user_id: user.id,
                                     project_id: project.id,
                                     params: params)
    expect(checklist.test_suite).to eq(test_suite)
  end

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id,
                           params: params)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end
end
