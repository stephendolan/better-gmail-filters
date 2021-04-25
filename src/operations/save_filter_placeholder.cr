class SaveFilterPlaceholder < FilterPlaceholder::SaveOperation
  include Lucky::TextHelpers

  needs filter : Filter
  needs current_user : User

  attribute value_list : String
  attribute readonly_name : String

  before_save do
    assign_filter
    convert_value_list_to_array
    validate_not_over_value_limit
    validate_not_over_filter_limit
  end

  # Because form inputs will be comma-delimited strings, massage in to an Array(String)
  private def convert_value_list_to_array
    if (submitted_values = value_list.value)
      values.value = submitted_values.split(",").map(&.strip).reject(&.blank?).compact.uniq!
    else
      values.value = [] of String
    end
  end

  private def validate_not_over_value_limit
    value_limit = 10
    value_count = values.value.try(&.size) || 0
    values_to_remove = value_count - value_limit

    if value_count > value_limit
      value_list.add_error "has a few too many values (#{value_count} / #{value_limit}). You need to remove #{pluralize(values_to_remove, "value")}"
    end
  end

  # This looks more complex than it is due to how we calculate usage
  # by combinations of dynamic filters.
  private def validate_not_over_filter_limit
    return if current_user.subscription.try(&.is_active?)

    filter_limit = Subscription::FREE_TIER_FILTER_LIMIT
    new_count = filter.siblings.flat_map(&.search_permutations).size
    current_placeholder_count = values.value.try(&.size) || 0

    if (existing_placeholder = record)
      new_count += existing_placeholder.siblings.product(&.values.size) * current_placeholder_count
    else
      new_count += filter.filter_placeholders!.product(&.values.size) * current_placeholder_count
    end

    if new_count >= filter_limit
      value_list.add_error "took you over the free filter limit (#{new_count} / #{filter_limit}). Remove some placeholder values, or upgrade for unlimited dynamic filters"
    end
  end

  private def assign_filter
    filter_id.value = filter.id
  end
end
