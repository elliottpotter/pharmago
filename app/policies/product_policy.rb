class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def new?
      trues
    end

    def create?
      true
    end

    def product_params?
      true
    end
  end
end
