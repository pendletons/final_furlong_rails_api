class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :generate_authentication_token

  validates :auth_token, uniqueness: true
  validates :email, email: true

  def generate_authentication_token
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end
end
