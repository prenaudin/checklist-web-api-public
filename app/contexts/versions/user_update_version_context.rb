class UserUpdateVersionContext < ApplicationContext
  attr_reader :version

  def initialize(user_id, project_id, checklist_id, version_id, data)
    @version = Version.find(version_id)
  end

  def call
    version.update_attributes(data)
    version
  end
end
