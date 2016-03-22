class LoggedTimesController < ApplicationController
  before_action :set_challenge

  def new
  end

  def create
    amount = params[:amount]
    LoggedTime.create!(challenge: @challenge, user: current_user, amount: amount)

  end

  private

  def set_challenge
    # FIXME: find in all your challenges (as creator or challenger)
    @challenge = current_user.challenges.find(params[:challenge_id])
  end
end
