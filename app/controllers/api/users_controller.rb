module Api
  class UsersController < Api::BaseController
    before_action :authenticate_user!

    def me
      render json: current_user, serializer: Api::UserSerializer
    end
  end
end
