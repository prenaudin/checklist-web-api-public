class UserUnshareChecklistContext < ApplicationContext
  attr_reader :checklist

  def initialize(user_id:, project_id:, checklist_id:)
    user       = UserRepository.find(id: user_id)
    project    = ProjectRepository.find_with_user(user: user,
                                                  project_id: project_id)
    @checklist = ChecklistRepository
                 .find_with_project(project: project,
                                    checklist_id: checklist_id)
  end

  def call
    ChecklistRepository.update(model: checklist, params: { is_public: false })
    checklist
  end
end
