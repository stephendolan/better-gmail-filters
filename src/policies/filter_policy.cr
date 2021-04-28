class FilterPolicy < ApplicationPolicy(Filter)
  def index?
    user ? true : false
  end

  def show?
    if (signed_in_user = user) && (filter = record)
      signed_in_user.id == filter.creator_id
    else
      false
    end
  end

  def create?
    index? && !over_trial_limit?
  end

  def update?
    show?
  end

  def delete?
    show?
  end

  private def over_trial_limit?
    return true unless (signed_in_user = user)
    return false if signed_in_user.active_subscription?

    filter_limit = Subscription::FREE_TIER_FILTER_LIMIT
    signed_in_user.filters.sum(&.variant_count) >= filter_limit
  end
end
