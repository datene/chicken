class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:edit, :update, :destroy, :accept, :decline, :concede]

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params_new)

    if user_signed_in?
      create_with_user
    else
      create_without_user
    end
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params_edit)
      flash[:notice] = "Succesfully created this challenge"
      UserMailer.welcome_email(@challenge).deliver_now
      redirect_to challenge_path
    else
      flash.now[:alert] = "Oops.. Let's try again"
    end
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

  def challenge_params_new
    params.require(:challenge).permit(:activity, :email_challenger, :wager_amount)
  end

  def challenge_params_edit
    params.require(:challenge).permit(:activity, :email_challenger, :wager_amount, :start_date, :deadline, :allotment)
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

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
