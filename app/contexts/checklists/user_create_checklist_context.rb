class UserCreateChecklistContext < ApplicationContext
  attr_reader :project, :params

  def initialize(user_id:, project_id:, params:)
    user     = UserRepository.find(user_id)
    @project = ProjectRepository.find_with_user(user: user,
                                                project_id: project_id)
    @params = coerce_to_params(params).permit(:title, test_suite: [])
  end

  def call
    checklist = Checklist.new(params)
    checklist.project = project
    checklist.save!
    checklist
  end
end
