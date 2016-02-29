class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
