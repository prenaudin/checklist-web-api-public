module Api
  class BaseController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken

    respond_to :json

    def up
      respond_with up?: true
    end

    def not_found
      render json: { error: 'not found' }, status: 404
    end
  end
end
