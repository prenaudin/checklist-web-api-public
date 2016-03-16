class UserDeleteProjectContext < ApplicationContext
  attr_reader :user, :project

  def initialize(user_id, project_id)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    #TODO Check Authorization
  end

  def call
    project.destroy!
    true
  end
end
