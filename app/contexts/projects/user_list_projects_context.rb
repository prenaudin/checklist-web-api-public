class UserListProjectsContext
  attr_reader :user

  def self.call(user_id)
    new(user_id).call
  end

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def call
    projects = Project.where(user: user)
    projects
  end
end
