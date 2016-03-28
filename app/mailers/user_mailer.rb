class UserMailer < ApplicationMailer
  def welcome_email(challenge)

    @challenge = challenge


    @creator = User.find(challenge.creator_id)

    # How to define this user as the friend someone puts in the form?
    # Redirect to our login part of the website
    #
    mail(to: @challenge.email_challenger, subject: @creator.first_name + " wants to challenge you" )
  end


end
