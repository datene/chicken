class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      if session[:new_challenge]
        sign_in_and_create_challenge
      elsif session[:challenge_to_accept]
        sign_in_and_accept_challenge
      else
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      end
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private

  def sign_in_and_accept_challenge
    sign_in @user

    challenge_id = session[:challenge_to_accept]

    challenge = Challenge.find(challenge_id)
    challenge.status = :accepted
    challenge.challenger = @user
    challenge.save!

    session[:challenge_to_accept] = nil

    flash[:notice] = "Welcome to this challenge!"
    redirect_to challenge_path(challenge)
  end

  def sign_in_and_create_challenge
    sign_in @user

    challenge_params = session[:new_challenge]

    challenge = Challenge.new(challenge_params)
    challenge.token = SecureRandom.hex(13)
    challenge.creator = @user
    challenge.save!

    session[:new_challenge] = nil

    redirect_to edit_challenge_path(challenge)
  end
end
