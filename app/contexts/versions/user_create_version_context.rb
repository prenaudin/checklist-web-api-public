class UserCreateVersionContext < ApplicationContext
  attr_reader :checklist, :user, :project, :params

  def initialize(user_id, project_id, checklist_id, given_params)
    @user = User.find(user_id)
    @project = user.projects.find(project_id)
    @checklist = project.checklists.find(checklist_id)
    @params = given_params.symbolize_keys
  end

  def call
    checklist.versions.create(params)
    checklist
  end
end
