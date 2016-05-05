RSpec.describe PublicUserShowVersionContext do
  let(:user)      { Factories.create_user }
  let(:user_bis)  { Factories.create_user }
  let(:project)   { Factories.create_project(user: user) }
  let(:checklist) { Factories.create_checklist(user: user, project: project) }
  let(:version) do
    Factories.create_version(user: user,
                             project: project,
                             public_token: 'a' * 24,
                             checklist: checklist)
  end

  let(:public_slug) do
    titles_slug = "#{version.title}-#{checklist.title}"
                  .parameterize
                  .truncate(30, separator: '-', omission: '')
    "#{titles_slug}-#{version.public_token}"
  end

  it 'raises a ActionController::ParameterMissing if token is not found' do
    expect do
      described_class.call(public_slug: '')
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns the version' do
    expect(described_class.call(public_slug: public_slug))
      .to eq(version)
  end
end
