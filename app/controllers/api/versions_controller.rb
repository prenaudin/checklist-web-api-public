module Api
  class VersionsController < Api::BaseController
    def create
      version = UserCreateVersionContext
                .call(user_id: current_user.id,
                      project_id: params[:project_id],
                      checklist_id: params[:checklist_id],
                      params: params[:data])
      render(json: version, serializer: Api::VersionSerializer, root: 'data')
    end

    def index
      versions = UserListVersionsContext
                 .call(user_id: current_user.id,
                       project_id: params[:project_id],
                       checklist_id: params[:checklist_id])
      render(json: versions,
             each_serializer: Api::VersionSerializer,
             root: 'data',
             include: params[:include])
    end

    def update
      version = UserUpdateVersionContext
                .call(user_id: current_user.id,
                      project_id: params[:project_id],
                      checklist_id: params[:checklist_id],
                      version_id: params[:id],
                      params: params[:data])
      render(json: version, serializer: Api::VersionSerializer, root: 'data')
    end

    def destroy
      UserDeleteVersionContext.call(user_id: current_user.id,
                                    project_id: params[:project_id],
                                    checklist_id: params[:checklist_id],
                                    version_id: params[:id])
      head :ok
    end
  end
end
