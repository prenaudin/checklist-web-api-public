class UserListVersionsContext < ApplicationContext
  attr_reader :versions

  def initialize(user_id:, project_id:, checklist_id:)
    user = UserRepository.find(id: user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    checklist = ChecklistRepository
                .find_with_project(project: project,
                                   checklist_id: checklist_id)
    @versions = VersionRepository.all_with_checklist(checklist: checklist)
  end

  def call
    versions
  end
end
