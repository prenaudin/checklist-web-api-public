module Api
  class ProjectsController < Api::BaseController
    before_action :authenticate_user!

    def index
      projects = UserListProjectsContext.call(user_id: current_user.id)
      render(json: projects,
             each_serializer: Api::ProjectSerializer,
             root: 'data',
             include: params[:include])
    end

    def show
      project = UserShowProjectContext.call(user_id: current_user.id,
                                            project_id: params[:id])
      render(json: project,
             serializer: Api::ProjectSerializer,
             root: 'data',
             include: params[:include])
    end

    def create
      project = UserCreateProjectContext.call(user_id: current_user.id,
                                              params: params[:data])
      render(json: project,
             serializer: Api::ProjectSerializer,
             root: 'data')
    end

    def update
      project = UserUpdateProjectContext.call(user_id: current_user.id,
                                              project_id: params[:id],
                                              params: params[:data])
      render(json: project,
             serializer: Api::ProjectSerializer,
             root: 'data')
    end

    def destroy
      UserDeleteProjectContext.call(user_id: current_user.id,
                                    project_id: params[:id])
      head :ok
    end
  end
end
