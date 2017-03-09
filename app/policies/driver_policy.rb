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

    def verify?
      true
    end

    def send_code?
      true
    end

  end
end
