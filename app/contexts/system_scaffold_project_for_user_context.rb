class SystemScaffoldProjectForUserContext < ApplicationContext
  attr_reader :user

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def call
    # Create a new Sample Project
    project = user.projects.create!(title: 'Sample Project')

    # Create Launch Website Checklist
    checklist_website = project.checklists.create!(title: 'Launch Website', test_suite: [])

    # Create House Cleaning Checklist
    checklist_house = project.checklists.create!(title: 'House Cleaning', test_suite: [])

    user
  end
end
