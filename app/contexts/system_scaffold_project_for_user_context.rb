class SystemScaffoldProjectForUserContext
  attr_reader :user

  def self.call(user_id)
    new(user_id).call
  end

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def call
    # Create a new Sample Project
    project = Project.new(title: 'Sample Project', user_id: user.id)
    project.save!

    # Create Launch Website Checklist
    checklist_website = Checklist.new(title: 'Launch Website', project_id: project.id)
    checklist_website.save!

    # Create House Cleaning Checklist
    checklist_house = Checklist.new(title: 'House Cleaning', project_id: project.id)
    checklist_house.save!

    user
  end
end
