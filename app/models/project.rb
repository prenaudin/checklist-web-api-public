class Project < ApplicationRecord
  belongs_to :user
  has_many :checklists

  validates :title, presence: true
end
