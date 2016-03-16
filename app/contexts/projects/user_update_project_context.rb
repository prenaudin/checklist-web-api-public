class UserUpdateProjectContext < ApplicationContext
  attr_reader :user, :project, :params

  def initialize(user_id, project_id, given_params)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    @params = given_params.symbolize_keys
    #TODO Check Authorization
  end

  def call
    project.update_attributes!(params)
    project
  end
end
