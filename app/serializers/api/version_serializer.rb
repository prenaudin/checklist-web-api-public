module Api
  class VersionSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title, :tests, :public_slug
    belongs_to :checklist, serializer: Api::ChecklistSerializer
  end
end
