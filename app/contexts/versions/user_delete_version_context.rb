class UserDeleteVersionContext < ApplicationContext
  attr_reader :version

  def initialize(user_id, project_id, checklist_id, version_id)
    @version = User.find(user_id)
                   .projects.find(project_id)
                   .checklists.find(checklist_id)
                   .versions.find(version_id)
  end

  def call
    version.destroy!
    true
  end
end
