class VersionRepository
  extend ApplicationRepository

  def self.model_class
    Version
  end

  def self.find_with_checklist(checklist:, version_id:)
    model_class.where(checklist_id: checklist.id).find(version_id)
  end
end
