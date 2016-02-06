class UserDeleteChecklistContext
  attr_reader :user, :project, :checklist

  def self.call(user_id, project_id, checklist_id)
    new(user_id, project_id, checklist_id).call
  end

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
