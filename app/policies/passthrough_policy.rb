class PassthroughPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def minirouter?
      true
    end
  end
end
