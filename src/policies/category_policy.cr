class CategoryPolicy < ApplicationPolicy(Category)
  def index?
    user ? true : false
  end

  def show?
    if (signed_in_user = user) && (category = record)
      signed_in_user.id == category.owner_id
    else
      false
    end
  end

  def create?
    index?
  end

  def update?
    show?
  end

  def delete?
    show?
  end
end
