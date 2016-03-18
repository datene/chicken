class ChallengesController < ApplicationController
  

  def new
    @challenge = Challenge.new 
    # @creator_id = current_user.id
    # challenger = User.new
    # @challenger_id = challenger.id

    # three questions should be created
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if user_signed_in?
      create_with_user
    else
      create_without_user
    end
  end

  def edit
    #real creation of the request and sends an email to the challenged?
  end

  def update
  end

  def destroy
  end 

  def accept # challenger that creates this challenge and gets a profile: connect to challenger_id 
  end

  def decline
  end

  def concede
  end

  private

  def challenge_params
    params.require(:challenge).permit(:activity, :email_challenger, :wager_amount)
  end 

  def create_with_user
    @challenge.creator = current_user

    if @challenge.save
      redirect_to edit_challenge_path(@challenge)
    else
      flash[:alert] = "blabla wrong params"
      render :new
    end
  end

  def create_without_user
    if @challenge.valid?
      session[:new_challenge] = challenge_params.to_hash
      redirect_to new_user_session_path
      # redirect_to user_omniauth_authorize_path(:facebook)
    else
      flash[:alert] = "blabla wrong params"
      render :new
    end

  end
end
