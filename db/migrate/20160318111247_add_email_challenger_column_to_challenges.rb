class AddEmailChallengerColumnToChallenges < ActiveRecord::Migration
  def up
    add_column :challenges, :email_challenger, :string 
  end

  def down
    remove_column :challenges, :email_challenger
  end
end
