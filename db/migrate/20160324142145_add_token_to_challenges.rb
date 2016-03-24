class AddTokenToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :token, :string
    add_index :challenges, :token
  end
end
