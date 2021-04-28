class FilterVariantPolicy < ApplicationPolicy(FilterVariant)
  def create?
    user ? true : false
  end

  def delete?
    create?
  end
end
