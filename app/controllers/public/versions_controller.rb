module Public
  class VersionsController < Public::BaseController
    def show
      version = PublicUserShowVersionContext.call(public_slug: params[:id])
      render(json: version,
             serializer: Api::VersionSerializer,
             root: 'data',
             include: params[:include])
    end
  end
end
