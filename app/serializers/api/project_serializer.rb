module Api
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at, :title
  end
end
