class UserDeleteProjectContext < ApplicationContext
  attr_reader :project

  def initialize(user_id:, project_id:)
    user = UserRepository.find(id: user_id)
    @project = ProjectRepository.find_with_user(user: user,
                                                project_id: project_id)
  end

  def call
    ProjectRepository.destroy(model: project)
    true
  end
end
