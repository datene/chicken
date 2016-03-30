class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :preview, :accept, :decline]

  before_action :set_challenge_by_token, only: [:preview, :accept, :decline]
  before_action :set_challenge, only: [:edit, :show, :update, :destroy, :concede]
  before_action :check_challenger_not_set, only: [:accept, :decline]
  
  def preview
  end

  def show 
    if @challenge.challenger_id.nil?
      flash[:notice] = "The challenger has not yet accepted your challenge!"
    end 

    check_checkpoints
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params_new)
    @challenge.token = SecureRandom.hex(13)

    if user_signed_in?
      create_with_user
    else
      create_without_user
    end
  end

  def edit
  end

  def update
    @challenge.assign_attributes(challenge_params_edit)
    @challenge.deadline = @challenge.start_date + 4.weeks

    if @challenge.save 
      flash[:notice] = "Succesfully created this challenge"
      UserMailer.welcome_email(@challenge).deliver_now

      # ChallengeMailer.invite_challenger(@challenge).deliver_now
      redirect_to challenge_path
    else
      flash.now[:alert] = "Oops.. Let's try again"
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to dashboard_path
  end

  def accept 
    if user_signed_in?
      accept_with_user
    else
      accept_without_user
    end
  end

  def decline
    @challenge.update(status: :declined)
    flash[:notice] = "Successfully declined. Thanks."

    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def concede
    @challenge.update(status: :conceded)
    flash[:notice] = "Successfully conceded, Chicken!"
    redirect_to dashboard_path
  end

  private

  def accept_with_user
    @challenge.status = :accepted
    @challenge.challenger = current_user
    @challenge.save

    flash[:notice] = "Welcome to this challenge!"
    redirect_to challenge_path(@challenge)
  end

  def accept_without_user
    session[:challenge_to_accept] = @challenge.id
    redirect_to user_omniauth_authorize_path(:facebook)
  end

  def challenge_params_new
    params.require(:challenge).permit(:activity, :email_challenger, :wager_amount)
  end

  def challenge_params_edit
    params.require(:challenge).permit(:activity, :email_challenger, :name_challenger, :wager_amount, :wager_description, :start_date, :deadline, :allotment)
  end

  def create_with_user
    @challenge.creator = current_user

    if @challenge.save
      redirect_to edit_challenge_path(@challenge)
    else
      flash[:alert] = "You haven't filled out the boxes correctly"
      render :new
    end
  end

  def create_without_user
    if @challenge.valid?
      session[:new_challenge] = challenge_params_new.to_hash
      redirect_to new_user_session_path
    else
      flash[:alert] = "You haven't filled out the boxes correctly"
      render :new
    end
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
    @challenge_decorator = ChallengeDecorator.decorate(@challenge)
  end

  def set_challenge_by_token
    @challenge = Challenge.where(status: "pending", token: params[:id]).first

    unless @challenge
      flash[:alert] = "Don't know what you're talking about"
      redirect_to root_path
    end
  end

  def check_challenger_not_set
    if @challenge.challenger
      flash[:alert] = "This challenge is already accepted!"
      redirect_to challenge_path(@challenge)
    end
  end

  def check_checkpoints
    Checkpoints::CheckService.new(@challenge, @challenge_decorator.current_week).call
  end
end
