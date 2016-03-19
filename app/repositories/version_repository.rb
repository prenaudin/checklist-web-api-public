class VersionRepository
  def model_class
    Version
  end

  def find_by_user(user_id:, project_id:, checklist_id:, version_id:)
    User.find(user_id)
        .projects.find(project_id)
        .checklists.find(checklist_id)
        .versions.find(version_id)
  end

  def create_by_user(user_id:, project_id:, checklist_id:, params:)
    User.find(user_id)
        .projects.find(project_id)
        .checklists.find(checklist_id)
        .versions.create(params)
  end

  def destroy(version:)
    version.destroy!
    true
  end

  def update(version:, params:)
    version.update_attributes!(params)
  end
end
