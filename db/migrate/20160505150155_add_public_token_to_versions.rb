class AddPublicTokenToVersions < ActiveRecord::Migration[5.0]
  def change
    add_column :versions, :public_token, :string
    add_index :versions, :public_token
  end
end
