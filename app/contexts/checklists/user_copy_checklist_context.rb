class UserCopyChecklistContext < ApplicationContext
  attr_reader :user, :project, :checklist, :destination_project

  def initialize(user_id, project_id, checklist_id, destination_project_id)
    @user = User.find(user_id)
    @destination_project = Project.find(destination_project_id)
    #TODO Check Authorization
    @project = Project.find(project_id)
    @checklist = Checklist.find(checklist_id)
  end

  def call
    new_checklist = Checklist.new
    new_checklist.title = checklist.title
    new_checklist.test_suite = checklist.test_suite
    new_checklist.project = destination_project
    new_checklist.save!
    new_checklist
  end
end
