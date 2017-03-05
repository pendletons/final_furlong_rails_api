# frozen_string_literal: true
class User < ActiveRecord::Base
  include ActiveModel::SecurePassword

  has_secure_password

  def generate_auth_token
    generate_token(:auth_token)
    self.auth_token_created_at = Time.current
    save!
    auth_token
  end

  def invalidate_auth_token
    update_columns(auth_token: nil, auth_token_created_at: nil)
  end

  private

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break if self.class.where(column => self[column]).count == 0
    end
  end
end
