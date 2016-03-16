class UserListChecklistsContext < ApplicationContext
  attr_reader :user, :project

  def initialize(user_id, project_id)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    #TODO Check Authorization
  end

  def call
    checklists = project.checklists
    checklists
  end
end
