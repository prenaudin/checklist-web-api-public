class Version < ActiveRecord::Base
  belongs_to :checklist

  validates :title, presence: true
  validates :tests, presence: true
end
