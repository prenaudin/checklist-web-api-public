class UserDeleteVersionContext < BaseContext
  attr_reader :version

  def initialize(user_id, project_id, checklist_id, version_id)
    @version = Version.find(version_id)
  end

  def call
    version.destroy!
    true
  end
end
