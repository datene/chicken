class AddNameChallengerToChallenge < ActiveRecord::Migration
  def up 
    add_column :challenges, :name_challenger, :string  
  end

  def down
    remove_column :challenges, :name_challenger
  end
end
