class UserCreateChecklistContext
  attr_reader :user, :project, :params

  def self.call(user_id, project_id, params)
    new(user_id, project_id, params).call
  end

  def initialize(user_id, project_id, given_params)
    @user = User.find(user_id)
    @project = Project.find(project_id)
    @params = given_params.symbolize_keys
    #TODO Check Authorization
  end

  def call
    checklist = Checklist.new
    checklist.project = project
    checklist.title = params[:title]
    checklist.test_suite = params[:test_suite]
    checklist.save!
    checklist
  end
end
