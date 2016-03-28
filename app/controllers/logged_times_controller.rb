class LoggedTimesController < ApplicationController
  before_action :set_challenge

  def new
  end

  def create
    amount = params[:amount]
    LoggedTime.create!(challenge: @challenge, user: current_user, amount: amount)
    setup_challenge(@challenge)
  end

  private

  def set_challenge
    @challenge = current_user.all_challenges.find(params[:challenge_id])
  end

  def setup_challenge(challenge)

    today = Date.current
    @current_week = ((1 + (today - challenge.start_date)) / 7).ceil

    check_checkpoints(@current_week)

    beginning_of_week = challenge.start_date + (@current_week - 1).weeks
    end_of_week = challenge.start_date + @current_week.weeks - 1.day

    # current week ratios
    @creator_logged_times_amount = challenge.logged_times.where(user: challenge.creator).between(beginning_of_week, end_of_week).sum(:amount)
    @challenger_logged_times_amount = challenge.logged_times.where(user: challenge.challenger).between(beginning_of_week, end_of_week).sum(:amount)


    @imagestyle_challenger_ratio =  set_image_ratio_challenger
    @imagestyle_creator_ratio = set_image_ratio_creator


    # after checkpoint ratios
    last_checkpoint = challenge.checkpoints.order(week: :desc).first

    if last_checkpoint
      weekly_amount = challenge.wager_amount / 4.0
      remaining_wager = ((4 - last_checkpoint.week) * weekly_amount)

      @current_amount_creator = remaining_wager + last_checkpoint.creator_score
      @current_amount_challenger = remaining_wager + last_checkpoint.challenger_score 

      @creator_bar_value    = (100 * @current_amount_creator) / (2 * challenge.wager_amount)
      @challenger_bar_value = 100 - @creator_bar_value
    else
      @current_amount_creator = challenge.wager_amount
      @current_amount_challenger = challenge.wager_amount 

      @creator_bar_value    = 50 
      @challenger_bar_value = 50 
    end
  end

  def check_checkpoints(current_week)
    missing_weeks = (1...current_week).to_a - @challenge.checkpoints.pluck(:week)

    missing_weeks.each do |week|
      Checkpoints::CreateService.new(@challenge, week).call
    end
  end


   def set_image_ratio_challenger
    ratio = 1 + @challenger_logged_times_amount / (@challenge.allotment * 60).to_f

    if ratio > 2
      return 2
    else
      return ratio
    end
  end
  
  def set_image_ratio_creator
    ratio = 1 + @creator_logged_times_amount / (@challenge.allotment * 60).to_f

    if ratio > 2
      return 2
    else
      return ratio
    end
  end
end
