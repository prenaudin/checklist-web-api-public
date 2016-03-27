class UserShowChecklistContext < ApplicationContext
  attr_reader :checklist

  def initialize(user_id:, project_id:, checklist_id:)
    user = UserRepository.find(user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    @checklist = ChecklistRepository
                 .find_with_user_and_project(user: user,
                                             project: project,
                                             checklist_id: checklist_id)
  end

  def call
    checklist
  end
end
