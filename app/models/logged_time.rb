class LoggedTime < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  scope :between, -> (start_date, end_date) do 
    where("DATE(created_at) >= :start_date AND DATE(created_at) <= :end_date", start_date: start_date, end_date: end_date)
  end
end