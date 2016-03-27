module Api
  class UsersController < Api::BaseController
    def me
      render json: current_user, serializer: Api::UserSerializer
    end
  end
end
