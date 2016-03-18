class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      if session[:new_challenge]
        sign_in_and_create_challenge
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

  def sign_in_and_create_challenge
    sign_in @user

    challenge_params = session[:new_challenge]

    challenge = Challenge.new(challenge_params)
    challenge.creator = @user
    challenge.save!

    session[:new_challenge] = nil

    redirect_to edit_challenge_path(challenge)
  end
end
