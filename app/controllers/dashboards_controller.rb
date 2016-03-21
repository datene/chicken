 class DashboardsController < ApplicationController

  def show
    #Ik weet niet of we hier User.challenges moeten gebruiken als we straks alle challenges per user willen laten zien?
    @challenges = Challenge.all
  end

end
