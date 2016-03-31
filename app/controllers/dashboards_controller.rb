class DashboardsController < ApplicationController

  def show
    set_challenges_current_user
    set_logged_times_current_user
  end

  private

  def set_challenges_current_user
    @challenges = ChallengeDecorator.decorate_collection(current_user.all_challenges)
  end

  def set_logged_times_current_user
    @sum_logged_times = current_user.logged_times.sum(:amount) / 60
  end
end
