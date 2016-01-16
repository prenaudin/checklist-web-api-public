module Api
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :access_token
  end
end
