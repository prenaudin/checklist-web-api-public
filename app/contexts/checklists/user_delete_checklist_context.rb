class UserDeleteChecklistContext < ApplicationContext
  attr_reader :user, :project, :checklist

  def initialize(user_id, project_id, checklist_id)
    @user = User.find(user_id)
    @checklist = Checklist.find(checklist_id)
    #TODO Check Authorization
  end

  def call
    checklist.destroy!
    true
  end
end
