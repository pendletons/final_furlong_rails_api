# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def manage?
    user.admin?
  end

  def index?
    user.admin?
  end

  def show?
    scope.exists?(id: record.id)
  end

  def create?
    manage?
  end

  def new?
    manage?
  end

  def update?
    manage?
  end

  def edit?
    manage?
  end

  def destroy?
    manage?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return as_relation(scope) if user.admin?
      scope
    end

    protected

    # Replaces the current FROM entity with a union of the given scopes.
    def union(scopes)
      # Note that scope.none doesn't behave correctly when used as an IN
      # e.g. `where claim_id: Claim.none` creates a clause
      #      `"claim_id" IN (SELECT "claims"."id" FROM "claims")`
      # therefore we use `where "1 = 0"` instead.
      return scope.where "1 = 0" if scopes.empty?
      return scopes.first if scopes.size == 1
      scope.from "(#{scopes.map(&:to_sql).join(' UNION ')}) #{scope.table_name}"
    end

    # Use this method to avoid chaining calls to `all`
    def as_relation(scope)
      if scope.is_a? ActiveRecord::Relation
        scope
      else
        scope.all
      end
    end
  end
end
