class UserListChecklistsContext
  attr_reader :user, :project

  def self.call(user_id, project_id)
    new(user_id, project_id).call
  end

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
