 class DashboardsController < ApplicationController

  def show
   @challenges = current_user.challenges
  end

end
