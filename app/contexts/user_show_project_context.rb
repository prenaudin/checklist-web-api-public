class UserShowProjectContext
  attr_reader :user, :project

  def self.call(user_id, project_id)
    new(user_id, project_id).call
  end

  def initialize(user_id, project_id)
    @user = User.find(user_id)
    @project = Project.find(project_id)
  end

  def call
    project
  end
end
