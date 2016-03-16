class UserUnshareChecklistContext < ApplicationContext
  attr_reader :user, :project, :checklist, :params

  def initialize(user_id, project_id, checklist_id)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    #TODO Check Authorization
    @checklist = Checklist.find(checklist_id)
  end

  def call
    checklist.is_public = false
    checklist.save!
    checklist
  end
end
