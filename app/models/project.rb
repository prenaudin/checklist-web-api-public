# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Project < ApplicationRecord
  belongs_to :user
  has_many :checklists

  validates :title, presence: true
end
