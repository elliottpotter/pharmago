class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

  end
  def minirouter?
    true
  end
end
