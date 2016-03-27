class ChecklistRepository
  extend ApplicationRepository

  def self.model_class
    Checklist
  end

  def self.find_with_project(project:, checklist_id:)
    all_with_project(project: project).find(checklist_id)
  end

  def self.all_with_project(project:)
    project.checklists
  end
end
