class FilterVariantPolicy < ApplicationPolicy(FilterVariant)
  def create?
    user ? true : false
  end
end
