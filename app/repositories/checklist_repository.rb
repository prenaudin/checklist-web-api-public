class ChecklistRepository
  extend ApplicationRepository

  def self.model_class
    Checklist
  end
end
