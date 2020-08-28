class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    if user
      return true
    else
      false
    end
  end

  def show?
    return true

  end

  def create?
    new?
  end

  def edit?
    if record.user == user
      return true
    else
      false
    end
  end


  def index?
    return true
  end

end
