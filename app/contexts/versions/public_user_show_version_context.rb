class PublicUserShowVersionContext < ApplicationContext
  attr_reader :version

  def initialize(public_slug:)
    token = public_slug.slice(-24, 24)
    raise ActiveRecord::RecordNotFound unless token
    @version = VersionRepository.find_by_public_token(public_token: token)
  end

  def call
    version
  end
end
