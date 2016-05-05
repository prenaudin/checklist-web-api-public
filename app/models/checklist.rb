# == Schema Information
#
# Table name: checklists
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#  test_suite  :jsonb            default("{}"), not null
#  is_public   :boolean          default("false"), not null
#  description :text
#

class Checklist < ApplicationRecord
  belongs_to :project
  has_many :versions

  validates :title, presence: true
  validates :test_suite, array_of_strings: true

  def last_version
    versions.order('created_at').first
  end
end
