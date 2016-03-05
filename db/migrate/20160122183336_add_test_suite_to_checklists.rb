class AddTestSuiteToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :test_suite, :jsonb, default: {}, null: false
  end
end
