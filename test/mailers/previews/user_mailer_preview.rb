class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    challenge = Challenge.last
    UserMailer.welcome_email(challenge)
  end

  def checkpoint_email
    challenge = Challenge.find(21)
    checkpoint = challenge.checkpoints.last

    UserMailer.checkpoint_email(challenge, checkpoint)
  end

  def endscore_email_tie
    challenge = Challenge.find(21)    
    UserMailer.endscore_email_tie(challenge)
  end

  def endscore_email_winner
    challenge = Challenge.find(21)    
    UserMailer.endscore_email_winner(challenge)
  end

end
