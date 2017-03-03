class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def index?
      true
    end

    def show?
      true
    end

    def new?
      true
    end

    def create?
      true
    end

    def claim?
      true
    end

    def order_params?
      true
    end

  end
end
