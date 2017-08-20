# frozen_string_literal: true

require_relative "application_policy"

class UserPolicy < ::ApplicationPolicy
  def show?
    true
  end
end
