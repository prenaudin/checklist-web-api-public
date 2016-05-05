class AddDescriptionToChecklists < ActiveRecord::Migration[5.0]
  def change
    add_column :checklists, :description, :text
  end
end
