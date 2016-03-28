module Checkpoints
  class CheckService
    def initialize(challenge, current_week)
      @challenge = challenge
      @current_week = current_week
    end

    def call
      missing_weeks = (1...@current_week).to_a - @challenge.checkpoints.pluck(:week)

      missing_weeks.each do |week|
        Checkpoints::CreateService.new(@challenge, week).call
      end
    end
  end
end