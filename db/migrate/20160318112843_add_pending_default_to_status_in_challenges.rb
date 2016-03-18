class AddPendingDefaultToStatusInChallenges < ActiveRecord::Migration
  def up
    change_column_default :challenges, :status, "pending"
  end

  def down
    change_column_default :challenges, :status, nil
  end
end
