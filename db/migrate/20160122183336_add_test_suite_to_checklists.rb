class AddTestSuiteToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :test_suite, :json, default: {}, null: false
  end
end
