class UserMailer < ApplicationMailer
  default from: 'blablabla@chicken.com'

  def welcome_email(challenge)

    @challenge = Challenge.find(challenge.id)

    @name_challenger = @challenge.name_challenger

    @email_challenger = @challenge.email_challenger
    @creator = User.find(challenge.creator_id)
    @creator_first_name = @challenge.creator.first_name
    @creator_last_name = @challenge.creator.last_name

    # How to define this user as the friend someone puts in the form?
    # Redirect to our login part of the website
    mail(to: @email_challenger, subject: 'Someone wants to challenge you')
  end


end
