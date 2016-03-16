class CreateLoggedTimes < ActiveRecord::Migration
  def change
    create_table :logged_times do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
