class UserShareVersionContext < ApplicationContext
  attr_reader :version

  def initialize(user_id:, project_id:, checklist_id:, version_id:)
    user = UserRepository.find(id: user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    checklist = ChecklistRepository
                .find_with_project(project: project,
                                   checklist_id: checklist_id)
    @version = VersionRepository
               .find_with_checklist(checklist: checklist,
                                    version_id: version_id)
  end

  def call
    VersionRepository.update(model: version,
                             params: { public_token: new_token })
    version
  end

  private

  def new_token
    SecureRandom.urlsafe_base64
  end
end
