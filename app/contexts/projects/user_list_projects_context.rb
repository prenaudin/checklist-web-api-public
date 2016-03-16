class UserListProjectsContext < ApplicationContext
  attr_reader :user

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def call
    projects = Project.where(user: user)
    projects
  end
end
