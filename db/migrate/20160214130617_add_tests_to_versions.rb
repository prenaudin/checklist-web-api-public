class AddTestsToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :tests, :jsonb, default: {}, null: false
  end
end
