class VersionRepository
  extend ApplicationRepository

  def self.model_class
    Version
  end

  def self.find_by_public_token(public_token:)
    model_class.find_by!(public_token: public_token)
  end

  def self.find_with_checklist(checklist:, version_id:)
    model_class.where(checklist_id: checklist.id).find(version_id)
  end

  def self.all_with_checklist(checklist:)
    model_class.where(checklist_id: checklist.id)
  end
end
