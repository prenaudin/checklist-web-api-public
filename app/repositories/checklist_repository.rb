class ChecklistRepository
  extend ApplicationRepository

  def self.model_class
    Checklist
  end

  def self.find_with_user_and_project(user:, project:, checklist_id:)
    all_with_user_and_project(user: user, project: project).find(checklist_id)
  end

  def self.all_with_user_and_project(user:, project:)
    ProjectRepository.find_with_user(user: user,
                                     project_id: project.id).checklists
  end
end
