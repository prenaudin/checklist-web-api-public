class UserShowProjectContext < ApplicationContext
  attr_reader :project

  def initialize(user_id:, project_id:)
    user     = UserRepository.find(user_id)
    @project = ProjectRepository.find_with_user(user: user,
                                                project_id: project_id)
  end

  def call
    project
  end
end
