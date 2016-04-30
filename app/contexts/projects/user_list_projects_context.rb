class UserListProjectsContext < ApplicationContext
  attr_reader :projects

  def initialize(user_id:)
    user      = UserRepository.find(id: user_id)
    @projects = ProjectRepository.all_with_user(user: user)
  end

  def call
    projects
  end
end
