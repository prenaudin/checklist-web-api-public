class UserListChecklistsContext < ApplicationContext
  attr_reader :checklists

  def initialize(user_id:, project_id:)
    user = User.find(user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    @checklists = ChecklistRepository.all_with_project(project: project)
  end

  def call
    checklists
  end
end
