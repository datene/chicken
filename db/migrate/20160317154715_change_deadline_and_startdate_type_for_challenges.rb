class ChangeDeadlineAndStartdateTypeForChallenges < ActiveRecord::Migration
  def up
    change_column :challenges, :start_date, :date
    change_column :challenges, :deadline, :date
  end

  def down
    change_column :challenges, :start_date, :datetime
    change_column :challenges, :deadline, :datetime
  end
end
