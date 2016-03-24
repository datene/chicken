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

    today = Date.current
    current_week = ((today - @challenge.start_date) / 7).ceil

    beginning_of_week = @challenge.start_date + (current_week - 1).weeks
    end_of_week = @challenge.start_date + current_week.weeks - 1.day

    # current week ratios
    @creator_logged_times_amount = @challenge.logged_times.where(user: @challenge.creator).between(beginning_of_week, end_of_week).sum(:amount)
    @challenger_logged_times_amount = @challenge.logged_times.where(user: @challenge.challenger).between(beginning_of_week, end_of_week).sum(:amount)


    @imagestyle_challenger_ratio =  set_image_ratio_challenger
    @imagestyle_creator_ratio = set_image_ratio_creator


    # after checkpoint ratios
    last_checkpoint = @challenge.checkpoints.order(week: :desc).first

    if last_checkpoint
      weekly_amount = @challenge.wager_amount / 4.0
      remaining_wager = ((4 - last_checkpoint.week) * weekly_amount)

      @current_amount_creator = remaining_wager + last_checkpoint.creator_score
      @current_amount_challenger = remaining_wager + last_checkpoint.challenger_score 

      @creator_bar_value    = (100 * @current_amount_creator) / (2 * @challenge.wager_amount)
      @challenger_bar_value = 100 - @creator_bar_value
    else
      @current_amount_creator = @challenge.wager_amount
      @current_amount_challenger = @challenge.wager_amount 

      @creator_bar_value    = 50 
      @challenger_bar_value = 50 
    end
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
      # UserMailer.welcome_email(@challenge).deliver_now
      redirect_to challenge_path
    else
      flash.now[:alert] = "Oops.. Let's try again"
    end
  end

  def destroy
  end

  def accept # challenger that creates this challenge and gets a profile: connect to challenger_id
    if user_signed_in?
      accept_with_user
    else
      accept_without_user
    end
  end

  def decline
    @challenge.update(status: :declined)
    flash[:notice] = "Successfully declined. Thanks."
    redirect_to root_path
  end

  def concede
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
    # redirect_to new_user_session_path
    redirect_to user_omniauth_authorize_path(:facebook)
  end

  def challenge_params_new
    params.require(:challenge).permit(:activity, :email_challenger, :wager_amount)
  end

  def challenge_params_edit
    params.require(:challenge).permit(:activity, :email_challenger, :name_challenger, :wager_amount, :start_date, :deadline, :allotment)
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
      session[:new_challenge] = challenge_params_new.to_hash
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

  def set_challenge_by_token
    @challenge = Challenge.where(status: "pending", token: params[:id]).first

    unless @challenge
      flash[:alert] = "Don't know what you're talking about :D"
      redirect_to root_path
    end
  end

  def check_challenger_not_set
    if @challenge.challenger
      flash[:alert] = "This challenge is already accepted!"
      redirect_to challenge_path(@challenge)
    end
  end

  def set_image_ratio_challenger
    ratio = 1 + @challenger_logged_times_amount / (@challenge.allotment * 60).to_f

    if ratio > 2
      return 2
    else
      return ratio
    end

  end
  

  def set_image_ratio_creator
    ratio = 1 + @creator_logged_times_amount / (@challenge.allotment * 60).to_f

    if ratio > 2
      return 2
    else
      return ratio
    end
  end
end
