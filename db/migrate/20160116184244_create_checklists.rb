class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
