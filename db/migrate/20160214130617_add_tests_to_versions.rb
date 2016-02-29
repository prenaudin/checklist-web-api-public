class AddTestsToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :tests, :json, default: {}, null: false
  end
end
