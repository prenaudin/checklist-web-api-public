class UserUpdateChecklistContext < ApplicationContext
  attr_reader :checklist, :params

  def initialize(user_id:, project_id:, checklist_id:, params:)
    user       = UserRepository.find(id: user_id)
    project    = ProjectRepository.find_with_user(user: user,
                                                  project_id: project_id)
    @checklist = ChecklistRepository
                 .find_with_project(project: project,
                                    checklist_id: checklist_id)
    @params    = coerce_to_params(params).permit(:title, test_suite: [])
  end

  def call
    ChecklistRepository.update(model: checklist, params: params)
    checklist
  end
end
