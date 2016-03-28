# == Schema Information
#
# Table name: versions
#
#  id           :integer          not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tests        :jsonb            default("{}"), not null
#  checklist_id :integer
#

class Version < ApplicationRecord
  belongs_to :checklist
  default_scope { order('created_at DESC') }

  validates :title, presence: true
  validates :tests, presence: true, array_of_hashes: true
end
