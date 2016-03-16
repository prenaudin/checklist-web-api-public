class UserUpdateChecklistContext < ApplicationContext
  attr_reader :user, :project, :checklist, :params

  def initialize(user_id, project_id, checklist_id, given_params)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    #TODO Check Authorization
    @checklist = Checklist.find(checklist_id)
    @params = given_params.symbolize_keys
  end

  def call
    checklist.title = params[:title]
    checklist.test_suite = params[:test_suite]
    checklist.save!
    checklist
  end
end
