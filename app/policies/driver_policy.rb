class DriverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def show?
      true
    end

    def switch?
      true
    end

  end
end
