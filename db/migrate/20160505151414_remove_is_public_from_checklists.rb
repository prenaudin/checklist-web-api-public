class RemoveIsPublicFromChecklists < ActiveRecord::Migration[5.0]
  def change
    remove_column :checklists, :is_public, :boolean
  end
end
