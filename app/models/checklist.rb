class Checklist < ApplicationRecord
  belongs_to :project
  has_many :versions

  validates :title, presence: true

  def last_version
    versions.last
  end
end
