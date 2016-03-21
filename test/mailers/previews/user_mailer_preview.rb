class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    challenge = Challenge.last
    UserMailer.welcome_email(challenge)
  end
end
