# frozen_string_literal: true

require "jwt"

class Auth
  ALGORITHM = "HS256"

  def self.issue(payload)
    JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, algorith: ALGORITHM).first
  end

  def self.auth_secret
    Rails.application.secrets.auth_token
  end
end
