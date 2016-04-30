class UserUpdateProjectContext < ApplicationContext
  attr_reader :user, :project, :params

  def initialize(user_id:, project_id:, params:)
    user     = UserRepository.find(id: user_id)
    @project = ProjectRepository.find_with_user(user: user,
                                                project_id: project_id)
    @params  = coerce_to_params(params).permit(:title)
  end

  def call
    ProjectRepository.update(model: project, params: params)
    project
  end
end
