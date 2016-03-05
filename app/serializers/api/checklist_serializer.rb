module Api
  class ChecklistSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title, :test_suite, :last_version
    belongs_to :project, serializer: Api::ProjectSerializer
    has_many :versions, serializer: Api::VersionSerializer
    has_one :last_version, serializer: Api::VersionSerializer
  end
end
