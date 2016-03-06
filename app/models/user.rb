class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  after_create :populate_sample_project

  has_many :projects
  before_create :skip_confirmation!
  validates :email, presence: true

  def populate_sample_project
    SystemScaffoldProjectForUserContext.call(id)
  end
end
