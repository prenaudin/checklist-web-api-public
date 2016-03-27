module Api
  class VersionsController < Api::BaseController
    def create
      checklist = UserCreateVersionContext.call(current_user.id, params[:project_id], params[:checklist_id], params[:data])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data'
    end

    def update
      checklist = UserUpdateVersionContext.call(current_user.id, params[:project_id], params[:checklist_id], params[:id], params[:data])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data'
    end

    def destroy
      UserDeleteVersionContext.call(current_user.id, params[:project_id], params[:checklist_id], params[:id])
      head :ok
    end
  end
end
