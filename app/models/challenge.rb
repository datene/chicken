class Challenge < ActiveRecord::Base
  belongs_to :creator, class_name: "User" #, foreign_key: "creator_id"
  belongs_to :challenger, class_name: "User" #, foreign_key: "challenger_id"
  has_many :messages, dependent: :destroy
  has_many :checkpoints, dependent: :destroy
  has_many :logged_times, dependent: :destroy

  validates :name_challenger, presence: true, on: :update
  validates :activity, presence: true, on: :update
  validates :email_challenger, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "that is not an email address!" }, on: :update
  validates :allotment, format: { with: /\A[+-]?\d+\Z/,
    message: "that is not a correct number of hours" }, on: :update
  validates :start_date, presence: true, on: :update
  validates :wager_amount, presence: true, format: { with: /\A[+-]?\d+\Z/,
    message: "don't forget to fill in the wager!" },  on: :update
end
