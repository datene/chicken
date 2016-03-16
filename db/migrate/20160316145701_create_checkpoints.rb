class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.integer :challenger_score
      t.references :challenge, index: true, foreign_key: true
      t.integer :creator_score
      t.integer :week

      t.timestamps null: false
    end
  end
end
