class FilterPlaceholderPolicy < ApplicationPolicy(FilterPlaceholder)
  def update?
    if (signed_in_user = user) && (parent_filter = record.try &.filter)
      signed_in_user.id == parent_filter.creator_id
    else
      false
    end
  end
end
