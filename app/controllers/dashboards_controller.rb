class DashboardsController < ApplicationController

  def show
   @challenges = current_user.all_challenges
    # raise
    #### FIX ME logged times by default 0 !
    
   # @logged_times_challenger = @challenge_challenger.logged_times 
   # @logged_times_creator = @challenge_creator.logged_times
  end
end
