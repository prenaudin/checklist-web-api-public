class UserRepository
  extend ApplicationRepository

  def self.model_class
    User
  end
end
