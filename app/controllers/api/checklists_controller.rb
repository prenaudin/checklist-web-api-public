module Api
  class ChecklistsController < Api::BaseController
    def index
      checklists = UserListChecklistsContext.call(current_user.id, params[:project_id])
      render json: checklists, each_serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def show
      checklist = UserShowChecklistContext.call(current_user.id, params[:project_id], params[:id])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def create
      checklist = UserCreateChecklistContext.call(current_user.id, params[:project_id], params[:data])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def update
      checklist = UserUpdateChecklistContext.call(current_user.id, params[:project_id], params[:data])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def destroy
      UserDeleteChecklistContext.call(current_user.id, params[:project_id], params[:id])
      head :ok
    end

    def share
      checklist = UserShareChecklistContext.call(current_user.id, params[:project_id], params[:id])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def unshare
      checklist = UserUnshareChecklistContext.call(current_user.id, params[:project_id], params[:id])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data', include: params[:include]
    end

    def copy
      checklist = UserCopyChecklistContext.call(current_user.id, params[:project_id], params[:id], params[:data][:project])
      render json: checklist, serializer: Api::ChecklistSerializer, root: 'data'
    end
  end
end
