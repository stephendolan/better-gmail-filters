class FilterPolicy < ApplicationPolicy(Filter)
  def index?
    user ? true : false
  end

  def show?
    if (filter = record)
      if (signed_in_user = user)
        signed_in_user.id == filter.creator_id || filter.is_public?
      else
        filter.is_public?
      end
    else
      false
    end
  end

  def export?
    show?
  end

  def create?
    index? && !over_trial_limit?
  end

  def update?
    if (filter = record) && (signed_in_user = user)
      signed_in_user.id == filter.creator_id
    else
      false
    end
  end

  def delete?
    update?
  end

  private def over_trial_limit?
    return true unless (signed_in_user = user)
    return false if signed_in_user.active_subscription?

    filter_limit = Subscription::FREE_TIER_FILTER_LIMIT
    signed_in_user.filters.sum(&.variant_count) >= filter_limit
  end
end
