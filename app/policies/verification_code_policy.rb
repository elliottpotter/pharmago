class VerificationCodePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def new?
      true
    end

    def create?
      true
    end

    def verify?
      true
    end

  end
end
