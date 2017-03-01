class PagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def home?
      true
    end
  end
end
