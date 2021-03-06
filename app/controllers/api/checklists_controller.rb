module Api
  class ChecklistsController < Api::BaseController
    def index
      checklists = UserListChecklistsContext
                   .call(user_id: current_user.id,
                         project_id: params[:project_id])
      render(json: checklists,
             each_serializer: Api::ChecklistSerializer,
             root: 'data',
             include: params[:include])
    end

    def show
      checklist = UserShowChecklistContext.call(user_id: current_user.id,
                                                project_id: params[:project_id],
                                                checklist_id: params[:id])
      render(json: checklist,
             serializer: Api::ChecklistSerializer,
             root: 'data',
             include: params[:include])
    end

    def create
      checklist = UserCreateChecklistContext
                  .call(user_id: current_user.id,
                        project_id: params[:project_id],
                        params: params[:data])
      render(json: checklist,
             serializer: Api::ChecklistSerializer,
             root: 'data',
             include: params[:include])
    end

    def update
      checklist = UserUpdateChecklistContext
                  .call(user_id: current_user.id,
                        project_id: params[:project_id],
                        checklist_id: params[:id],
                        params: params[:data])
      render(json: checklist,
             serializer: Api::ChecklistSerializer,
             root: 'data',
             include: params[:include])
    end

    def destroy
      UserDeleteChecklistContext.call(user_id: current_user.id,
                                      project_id: params[:project_id],
                                      checklist_id: params[:id])
      head :ok
    end
  end
end
