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
end
