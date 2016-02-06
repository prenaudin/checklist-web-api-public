module Api
  class ChecklistSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title, :test_suite
    belongs_to :project, serializer: Api::ProjectSerializer
  end
end
