class UserCreateProjectContext < ApplicationContext
  attr_reader :user, :params

  def initialize(user_id:, params:)
    @user   = UserRepository.find(id: user_id)
    @params = coerce_to_params(params).permit(:title)
  end

  def call
    project       = Project.new(params)
    project.user  = user
    ProjectRepository.create(model: project)
    project
  end
end
