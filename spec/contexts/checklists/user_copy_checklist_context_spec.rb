RSpec.describe UserCopyChecklistContext do
  let(:user)                { Factories.create_user }
  let(:user_bis)            { Factories.create_user }
  let(:project)             { Factories.create_project(user: user) }
  let(:project_bis)         { Factories.create_project(user: user) }
  let(:destination_project) { Factories.create_project(user: user) }
  let(:project_user_bis) do
    Factories.create_project(user: user_bis)
  end
  let(:checklist) do
    Factories.create_checklist(user: user, project: project)
  end

  it 'returns a new checklist' do
    checklist_returned = described_class
                         .call(user_id: user.id,
                               project_id: project.id,
                               checklist_id: checklist.id,
                               destination_project_id: destination_project.id)
    expect(checklist_returned.id).to_not eq(checklist)
  end

  it 'copies the title' do
    checklist_returned = described_class
                         .call(user_id: user.id,
                               project_id: project.id,
                               checklist_id: checklist.id,
                               destination_project_id: destination_project.id)
    expect(checklist_returned.title).to eq(checklist.title)
  end

  it 'copies the test_suite' do
    checklist_returned = described_class
                         .call(user_id: user.id,
                               project_id: project.id,
                               checklist_id: checklist.id,
                               destination_project_id: destination_project.id)
    expect(checklist_returned.test_suite).to eq(checklist.test_suite)
  end

  it 'copies the a destination project' do
    checklist_returned = described_class
                         .call(user_id: user.id,
                               project_id: project.id,
                               checklist_id: checklist.id,
                               destination_project_id: destination_project.id)
    expect(checklist_returned.project_id).to eq(destination_project.id)
  end

  it 'raises an error if the project is not managed by the user' do
    expect do
      described_class
        .call(user_id: user_bis.id,
              project_id: project.id,
              checklist_id: checklist.id,
              destination_project_id: destination_project.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'raises an error if the checklist is not in the project' do
    expect do
      described_class
        .call(user_id: user.id,
              project_id: project_bis.id,
              checklist_id: checklist.id,
              destination_project_id: destination_project.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'raises an error if the destination project does not belong to the user' do
    expect do
      described_class
        .call(user_id: user.id,
              project_id: project_bis.id,
              checklist_id: checklist.id,
              destination_project_id: project_user_bis.id)
    end.to raise_error(ActiveRecord::RecordNotFound)
  end
end
