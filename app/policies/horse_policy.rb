# frozen_string_literal: true

require_relative "application_policy"

class HorsePolicy < ::ApplicationPolicy
  def show?
    true
  end
end
