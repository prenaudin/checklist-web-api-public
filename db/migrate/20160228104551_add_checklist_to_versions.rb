class AddChecklistToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :checklist_id, :integer, index: true
  end
end
