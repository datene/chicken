class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :deadline
      t.integer :allotment
      t.string :status
      t.string :activity
      t.integer :creator_id
      t.integer :challenger_id
      t.integer :wager_amount
      t.text :wager_description
      t.string :wager_name

      t.timestamps null: false
    end
    add_foreign_key :challenges, :users, column: "creator_id"
    add_foreign_key :challenges, :users, column: "challenger_id"
    add_index :challenges, :creator_id
    add_index :challenges, :challenger_id
  end
end
