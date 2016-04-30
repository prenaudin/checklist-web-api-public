class UserCreateVersionContext < ApplicationContext
  attr_reader :checklist, :params

  def initialize(user_id:, project_id:, checklist_id:, params:)
    user = UserRepository.find(id: user_id)
    project = ProjectRepository.find_with_user(user: user,
                                               project_id: project_id)
    @checklist = ChecklistRepository
                 .find_with_project(project: project,
                                    checklist_id: checklist_id)
    @params = coerce_to_params(params).permit(:title,
                                              tests: permitted_fields)
  end

  def call
    version           = Version.new(params)
    version.checklist = checklist
    VersionRepository.create(model: version)
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
