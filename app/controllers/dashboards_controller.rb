class DashboardsController < ApplicationController

  def show
    set_challenges_current_user
    set_logged_times_current_user
    set_opponent_for_challenge
  end


  private

  def set_challenges_current_user
    @challenges = ChallengeDecorator.decorate_collection(current_user.all_challenges)
  end


  def set_logged_times_current_user
    @logged_times = LoggedTime.where(user_id: current_user.id)
    @sum_logged_times = 0
    @logged_times.each do |logged_time|
      @sum_logged_times += logged_time.amount
    end
  end

  def set_opponent_for_challenge
    @challenges.each do |challenge|
      @opponents = User.where.not(id: current_user.id) 
    end

    @opponents.each do |opponent|
      @opponent = opponent
    end

    if @opponent.picture == ""
      @opponent.picture = "http://static1.squarespace.com/static/55b0eea6e4b0eac970b56fa2/t/567c8e6de0327cd48acb8afe/1451003519533/chicken-sombrero.gif"
    end

  end
end
