# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword

  has_secure_password

  validates :name, :email, presence: true
end
