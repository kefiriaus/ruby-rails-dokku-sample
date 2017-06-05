class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook, :vkontakte, :odnoklassniki, :instagram]

  has_many :user_providers, dependent: :destroy

  #mount_uploader :avatar, UserAvatarUploader

  def to_s
    name
  end

  def provider
    return nil unless user_providers.present?
    user_providers.first.provider
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      omniauth_providers.each do |provider|
        provider = provider.to_s
        if session["devise.#{provider}_data"] && session["devise.#{provider}_data"]["extra"]["raw_info"]
          data = session["devise.#{provider}_data"]
          break
        end
      end
      data ||= nil
      user.email = data["email"] if data.present? && user.email.blank?
    end
  end

  def self.from_omniauth(request)
    auth = request.env["omniauth.auth"]
    user_provider = UserProvider.where(provider: auth.provider, uid: auth.uid).first_or_create! do |provider|
      email = auth.info.email || auth.extra.raw_info.email || "#{auth.uid}@#{ENV['domain']}"
      provider.user = User.where(email: email).first_or_create! do |user|
        user.email = email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        # user.remote_picture_url = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
    user_provider.user
  end
end
