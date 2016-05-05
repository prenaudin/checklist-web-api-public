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
#  public_token :string
#

class Version < ApplicationRecord
  belongs_to :checklist
  default_scope { order('created_at DESC') }

  validates :title, presence: true
  validates :tests, presence: true, array_of_hashes: true
  validates :public_token, uniqueness: true

  # In the form of "the-version-title-the-checklist-title-24charslongtoken"
  def public_slug
    return nil unless public_token
    titles_slug = "#{title}-#{checklist.title}"
                  .parameterize
                  .truncate(30, separator: '-', omission: '')
    "#{titles_slug}-#{public_token}"
  end
end
