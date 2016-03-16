class UserCreateProjectContext < ApplicationContext
  attr_reader :user, :params

  def initialize(user_id, given_params)
    @user = User.find(user_id)
    @params = given_params.symbolize_keys
  end

  def call
    project = Project.new
    project.user = user
    project.title = params[:title]
    project.save!
    project
  end
end
