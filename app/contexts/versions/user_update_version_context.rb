class UserUpdateVersionContext < ApplicationContext
  attr_reader :version, :params

  def initialize(user_id:, project_id:, checklist_id:, version_id:, params:)
    user = UserRepository.find(user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    checklist = ChecklistRepository
                .find_with_project(project: project,
                                   checklist_id: checklist_id)
    @version = VersionRepository
               .find_with_checklist(checklist: checklist,
                                    version_id: version_id)
    @params = coerce_to_params(params).permit(:title,
                                              tests: permitted_fields)
  end

  def call
    VersionRepository.update(version, params)
    version
  end

  private

  def permitted_fields
    [
      :id,
      :title,
      :comment,
      :status,
      :show_comment
    ]
  end
end
