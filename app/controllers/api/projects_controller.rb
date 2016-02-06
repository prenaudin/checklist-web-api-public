module Api
  class ProjectsController < Api::BaseController
    before_action :authenticate_user!

    def index
      projects = UserListProjectsContext.call(current_user.id)
      render json: projects, each_serializer: Api::ProjectSerializer, root: 'data', include: params[:include]
    end

    def show
      project = UserShowProjectContext.call(current_user.id, params[:id])
      render json: project, serializer: Api::ProjectSerializer, root: 'data', include: params[:include]
    end

    def create
      project = UserCreateProjectContext.call(current_user.id, params[:data])
      render json: project, serializer: Api::ProjectSerializer, root: 'data'
    end

    def update
      project = UserUpdateProjectContext.call(current_user.id, params[:id], params[:data])
      render json: project, serializer: Api::ProjectSerializer, root: 'data'
    end

    def destroy
      UserDeleteProjectContext.call(current_user.id, params[:id])
      head :ok
    end
  end
end
