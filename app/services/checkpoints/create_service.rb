module Checkpoints
  class CreateService
    def initialize(challenge, week)
      @challenge = challenge
      @week = week
    end

## TODO: background jobs that create the checkpoints

    def call
      return if checkpoint_exists?
      @weekly_amount = @challenge.wager_amount / 4.0

      compute_score_ratios
      create_checkpoint
      notify_players
    end

    private

    def compute_score_ratios
      allotment_in_minutes = @challenge.allotment * 60.0

      beginning_of_week = @challenge.start_date + (@week - 1).weeks
      end_of_week = @challenge.start_date + @week.weeks - 1.day
      creator_logged_times_amount = @challenge.logged_times.where(user: @challenge.creator).between(beginning_of_week, end_of_week).sum(:amount)
      challenger_logged_times_amount = @challenge.logged_times.where(user: @challenge.challenger).between(beginning_of_week, end_of_week).sum(:amount)

      @creator_score_ratio = creator_logged_times_amount > 0 ? creator_logged_times_amount / allotment_in_minutes : 0
      @challenger_score_ratio = challenger_logged_times_amount > 0 ? challenger_logged_times_amount / allotment_in_minutes : 0
    end

    def create_checkpoint
      @checkpoint = @challenge.checkpoints.new(week: @week)

      last_checkpoint             = @challenge.checkpoints.order(week: :desc).first
      @checkpoint.creator_score    = last_checkpoint ? last_checkpoint.creator_score : 0
      @checkpoint.challenger_score = last_checkpoint ? last_checkpoint.challenger_score : 0

      if same_ratio? || both_winners?
        @checkpoint.creator_score += @weekly_amount
        @checkpoint.challenger_score += @weekly_amount

      elsif creator_winner? || challenger_bigger_looser? 
        amount_lost = @weekly_amount * (1 - @challenger_score_ratio)

        @checkpoint.creator_score += @weekly_amount + amount_lost
        @checkpoint.challenger_score += @weekly_amount - amount_lost

      elsif creator_looser? || creator_bigger_looser?
        amount_lost = @weekly_amount * ( 1 - @creator_score_ratio)

        @checkpoint.creator_score += @weekly_amount - amount_lost
        @checkpoint.challenger_score += @weekly_amount + amount_lost
      end

      @checkpoint.save
    end

    def notify_players
      if @week == 4
        if @winner == "tie"
          # UserMailer.endscore_email_tie(@challenge).deliver_now
        else
          # UserMailer.endscore_email_winner(@challenge).deliver_now
        end
      else
        UserMailer.checkpoint_email(@challenge, @checkpoint).deliver_now
      end
    end

    # predicates
    
    def checkpoint_exists?
      @challenge.checkpoints.where(week: @week).exists?
    end

    def same_ratio?
      @creator_score_ratio == @challenger_score_ratio
    end

    def both_winners?
      @creator_score_ratio >= 1 && @challenger_score_ratio >= 1
    end

    def creator_winner?
      @creator_score_ratio >= 1 && @challenger_score_ratio <= 1
    end

    def creator_looser?
      @creator_score_ratio <= 1 && @challenger_score_ratio >= 1
    end

    def challenger_bigger_looser?
      @creator_score_ratio < 1 && @creator_score_ratio > @challenger_score_ratio
    end

    def creator_bigger_looser?
      @challenger_score_ratio < 1 && @challenger_score_ratio > @creator_score_ratio
    end
  end
end