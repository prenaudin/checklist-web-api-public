class UserCopyChecklistContext < ApplicationContext
  attr_reader :checklist, :destination_project

  def initialize(user_id:, project_id:, checklist_id:, destination_project_id:)
    user = UserRepository.find(id: user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    @checklist = ChecklistRepository
                 .find_with_project(project: project,
                                    checklist_id: checklist_id)
    @destination_project = ProjectRepository
                           .find_with_user(user: user,
                                           project_id: destination_project_id)
  end

  def call
    new_checklist            = Checklist.new
    new_checklist.title      = checklist.title
    new_checklist.test_suite = checklist.test_suite
    new_checklist.project    = destination_project
    new_checklist.save!
    new_checklist
  end
end
