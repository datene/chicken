class Challenge < ActiveRecord::Base
  belongs_to :creator, class_name: "User" #, foreign_key: "creator_id"
  belongs_to :challenger, class_name: "User" #, foreign_key: "challenger_id"
end
