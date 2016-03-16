class ApplicationContext
  def self.call(*args)
    new(*args).call
  end
end
