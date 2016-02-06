class AddIsPublicToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :is_public, :boolean, default: false, null: false
  end
end
