class ChallengeDecorator < Draper::Decorator
  delegate_all

  def current_week
    @current_week ||= ((1 + (Date.current - object.start_date)) / 7).ceil
  end

  # current week
  
  def logged_times_amounts
    @challenger_logged_times_amount ||= object.logged_times.where(user: object.challenger).between(beginning_of_week, end_of_week).sum(:amount)
    @creator_logged_times_amount ||= object.logged_times.where(user: object.creator).between(beginning_of_week, end_of_week).sum(:amount)

    {
      creator: @creator_logged_times_amount,
      challenger: @challenger_logged_times_amount 
    }
  end

  def logged_times_ratios
    @logged_times_ratios ||= {
      creator: logged_amount_ratio(logged_times_amounts[:creator]),
      challenger: logged_amount_ratio(logged_times_amounts[:challenger])
    } 
  end

  # after checkpoint

  def bar_values
    return @bar_values if @bar_values

    if last_checkpoint
      creator_bar_value    = (100 * current_amounts[:creator]) / (2 * object.wager_amount)
      challenger_bar_value = 100 - creator_bar_value
    else
      creator_bar_value    = 50 
      challenger_bar_value = 50 
    end

    @bar_values = {
      creator: creator_bar_value,
      challenger: challenger_bar_value
    }
  end

  def current_amounts
    return @current_amounts if @current_amounts

    if last_checkpoint
      weekly_amount = object.wager_amount / 4.0
      remaining_wager = ((4 - last_checkpoint.week) * weekly_amount)

      current_amount_creator = remaining_wager + last_checkpoint.creator_score
      current_amount_challenger = remaining_wager + last_checkpoint.challenger_score 
    else
      current_amount_creator = object.wager_amount
      current_amount_challenger = object.wager_amount 
    end

    @current_amounts = {
      creator: current_amount_creator,
      challenger: current_amount_challenger
    }
  end

  private

  def logged_amount_ratio(logged_times_amount)
    ratio = 1 + logged_times_amount / (object.allotment * 60).to_f

    if ratio > 2
      return 2
    else
      return ratio
    end
  end

  def beginning_of_week
    @beginning_of_week ||= object.start_date + (current_week - 1).weeks
  end

  def end_of_week
    @end_of_week ||= object.start_date + current_week.weeks - 1.day
  end

  def last_checkpoint
    @last_checkpoint ||= object.checkpoints.order(week: :desc).first
  end
end