class Checklist < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  validates :test_suite, presence: true
  validates :is_public, presence: true
end
