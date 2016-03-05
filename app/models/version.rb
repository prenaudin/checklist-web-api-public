class Version < ActiveRecord::Base
  belongs_to :checklist
  default_scope { order('created_at DESC') }

  validates :title, presence: true
  validates :tests, presence: true
end
