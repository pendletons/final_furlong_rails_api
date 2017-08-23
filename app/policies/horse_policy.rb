# frozen_string_literal: true

require_relative "application_policy"

class HorsePolicy < ::ApplicationPolicy
  def show?
    true
  end

  def create?
    user && (user.admin? || horse.owned_by?(user.stable))
  end
end
