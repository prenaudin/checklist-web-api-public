module Api
  class ChecklistSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title, :description, :test_suite
    belongs_to :project, serializer: Api::ProjectSerializer
    has_many :versions, serializer: Api::VersionSerializer
    has_one :last_version, serializer: Api::VersionSerializer
  end
end
