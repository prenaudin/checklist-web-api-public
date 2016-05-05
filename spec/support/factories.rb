module Factories
  class Counter
    attr_reader :count, :mutex

    def initialize
      @count = 0
      @mutex = Mutex.new
    end

    def increment
      mutex.synchronize do
        @count = count + 1
      end
      count
    end
  end

  UserCounter = Counter.new

  def self.create_user
    User.create!(email: "email#{UserCounter.increment}@example.com",
                 password: 'a' * 8,
                 password_confirmation: 'a' * 8)
  end

  def self.create_project(user:, title: 'Azendoo')
    UserCreateProjectContext.call(user_id: user.id,
                                  params: { title: title })
  end

  def self.create_checklist(user:,
                            project:,
                            title: 'QA',
                            description: 'This is description test',
                            test_suite: ['Task 1', 'Task 2', 'Task 3'])
    UserCreateChecklistContext.call(user_id: user.id,
                                    project_id: project.id,
                                    params: { title: title,
                                              description: description,
                                              test_suite: test_suite })
  end

  def self.create_version(user:,
                          project:,
                          checklist:,
                          title: 'Website',
                          tests: [
                            {
                              'id'           => '1',
                              'title'        => 'Deploy',
                              'comment'      => '',
                              'status'       => 'ok',
                              'show_comment' => false
                            }])
    UserCreateVersionContext.call(user_id: user.id,
                                  project_id: project.id,
                                  checklist_id: checklist.id,
                                  params: { title: title,
                                            tests: tests })
  end
end
