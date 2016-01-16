class AddProjectToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :project_id, :integer, index: true
  end
end
