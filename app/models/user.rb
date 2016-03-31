class User < ActiveRecord::Base
  has_many :challenges, foreign_key: "creator_id", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :checkpoints, through: :challenges
  has_many :logged_times, dependent: :destroy
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
    user = User.find_by_email(auth.info.email)

    unless user
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize 
    end

    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]  # Fake password for validation
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.picture = auth.info.image
    user.token = auth.credentials.token
    user.token_expiry = Time.at(auth.credentials.expires_at)

    user.save
    user
  end

  def all_challenges
    Challenge.where("creator_id = :id OR challenger_id = :id", id: id)
  end
end


