module Api
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title
    has_many :checklists, serializer: Api::ChecklistSerializer
    belongs_to :user, serializer: Api::UserSerializer
  end
end
