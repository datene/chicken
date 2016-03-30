class UserMailer < ApplicationMailer
  def welcome_email(challenge)
    @challenge = challenge
    @creator = challenge.creator
    mail(to: @challenge.email_challenger, subject: "#{@creator.first_name} wants to challenge you" )
  end

  def checkpoint_email(challenge, checkpoint)
    @challenge = challenge
    @checkpoint = checkpoint
    @challenger = challenge.challenger
    @creator = challenge.creator
    @creator_email = @creator.email
    mail(to: [@challenge.email_challenger, @creator_email], subject: "Your weekly score" )
  end

  def endscore_email_tie(challenge)
    @challenge = challenge
    @challenger = challenge.challenger
    @creator = challenge.creator
    @creator_email = @creator.email
    mail(to: [@challenge.email_challenger, @creator_email], subject: "The final score of your challenge" )
  end

  def endscore_email_winner(challenge)
    @challenge = challenge
    @challenger = challenge.challenger
    @creator = challenge.creator
    @creator_email = @creator.email
    if @challenge.winner == "creator"
      @loser = @challenge.challenger
    else 
      @loser = @challenge.creator
    end
    mail(to: [@challenge.email_challenger, @creator_email], subject: "The final score of your challenge" )
  end
end
