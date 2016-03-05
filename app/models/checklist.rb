class Checklist < ActiveRecord::Base
  belongs_to :project
  has_many :versions

  validates :title, presence: true
  validates :test_suite, presence: true
end