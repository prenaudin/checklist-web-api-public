class ProjectRepository
  extend ApplicationRepository

  def self.model_class
    Project
  end

  def self.find_with_user(user:, project_id:)
    all_with_user(user: user).find(project_id)
  end

  def self.all_with_user(user:)
    model_class.where(user_id: user.id)
  end
end
