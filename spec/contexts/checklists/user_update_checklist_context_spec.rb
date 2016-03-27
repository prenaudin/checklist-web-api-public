RSpec.describe UserUpdateChecklistContext do
  let(:user)      { Factories.create_user }
  let(:user_bis)  { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:project_user_bis) do
    Factories.create_project(user: user_bis)
  end
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:params) { { title: 'New Title', test_suite: ['Task 4'] } }

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project.id,
                           checklist_id: checklist.id,
                           params: params)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'raises an error if the checklist is not in the project' do
    expect do
      described_class.call(user_id: user_bis.id,
                           project_id: project_user_bis.id,
                           checklist_id: checklist.id,
                           params: params)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'updates the checklist title' do
    checklist_returned = described_class.call(user_id: user.id,
                                              project_id: project.id,
                                              checklist_id: checklist.id,
                                              params: params)
    expect(checklist_returned.title).to eq(params[:title])
  end

  it 'update the checklist test suite' do
    checklist_returned = described_class.call(user_id: user.id,
                                              project_id: project.id,
                                              checklist_id: checklist.id,
                                              params: params)
    expect(checklist_returned.test_suite).to eq(params[:test_suite])
  end
end
